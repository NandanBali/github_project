
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:github_plus_plus/components/info_page_topbar.dart';
import 'package:github_plus_plus/components/standard_card.dart';
import 'package:github_plus_plus/components/standard_card_2.dart';
import 'package:github_plus_plus/controller/github_data_controller.dart';
import 'package:github_plus_plus/helper_functions.dart';
import 'package:github_plus_plus/models/gh_repository.dart';
import 'package:github_plus_plus/view/repository/files_view.dart';
import 'package:github_plus_plus/view/user/user_view.dart';
import 'package:google_fonts/google_fonts.dart';

class RepositoryView extends StatefulWidget {
  final GHRepository repository;

  const RepositoryView({super.key, required this.repository});

  @override
  State<RepositoryView> createState() => _RepositoryViewState();
}

class _RepositoryViewState extends State<RepositoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/space_bg3.jpg"), fit: BoxFit.cover),
        ),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.black.withOpacity(0.3),
              automaticallyImplyLeading: false,
              pinned: true,
              floating: true,
              snap: true,
              expandedHeight: 300.0,
              collapsedHeight: kToolbarHeight,
              title: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                final isCollapsed = constraints.maxHeight <= kToolbarHeight;
                return isCollapsed ? Text("${widget.repository.owner.name}/") : const Text("");
              }),
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                  child: Column(
                      children: [
                        const InfoPageTopbar(),
                        const SizedBox(
                          height: 32.0,
                          width: double.infinity,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserView(user: widget.repository.owner)));
                          },
                          child: Row(
                            children: [
                              CircleAvatar(
                                foregroundImage: NetworkImage(
                                    widget.repository.owner.details["avatar"]),
                                radius: 16.0,
                              ),
                              const SizedBox(
                                width: 8.0,
                              ),
                              Text(
                                widget.repository.owner.name,
                                style: const TextStyle(fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 12.0,
                        ),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              widget.repository.name,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 32.0),
                            )),
                        const SizedBox(
                          height: 12.0,
                        ),
                        Flexible(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child:
                                Text(widget.repository.misc_details["description"] == null ? "" : widget.repository.misc_details["description"]),
                          ),
                        ),
                        const SizedBox(
                          height: 12.0,
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.star_border,
                                    size: 20.0,
                                  ),
                                  const SizedBox(
                                    width: 4.5,
                                  ),
                                  Text(
                                    HelperFunctions().iTok(
                                        widget.repository.misc_details["stars"]),
                                    style: const TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                  const Text(" stars"),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 12.0,
                            ),
                            GestureDetector(
                              child: const Row(
                                children: [
                                  Icon(Icons.merge),
                                  SizedBox(
                                    width: 4.5,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 16.0,)
                      ],
                  ),
                ),
              ),
            ),
            // readme and shit
            SliverList(delegate: SliverChildListDelegate(
              [
                Container(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Column(
                    children: [
                      StandardCard(
                          innerContainer: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "See all files",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20.0),
                              ),
                              Icon(Icons.arrow_forward_ios)
                            ],
                          ),
                          routeDestination:
                              FilesView(repository: widget.repository)),
                      FutureBuilder(
                        future: GithubDataController().getRepositoryReadme(widget.repository),
                        builder: (context, snapshot) {
                          if(snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                            return StdCardNoPush(
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("   Readme.md", style: GoogleFonts.firaCode(
                                      fontSize: 16.0,
                                    ),),
                                  ),
                                  const Divider(thickness: 0.64, indent: 16.0, endIndent: 16.0,),
                                  Container(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Html(data: snapshot.data!, style: {
                                      "p": Style(
                                        color: Colors.white
                                      ),
                                    },)
                                  ),
                                ],
                              ),
                            );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}

