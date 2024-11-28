import 'package:flutter/material.dart';
import 'package:github_plus_plus/components/info_page_topbar.dart';
import 'package:github_plus_plus/components/standard_card.dart';
import 'package:github_plus_plus/controller/github_data_controller.dart';
import 'package:github_plus_plus/models/gh_repository.dart';
import 'package:github_plus_plus/models/gh_user.dart';
import 'package:github_plus_plus/globals.dart' as globals;
import 'package:github_plus_plus/view/repository/repository_view.dart';

class UserView extends StatefulWidget {
  final GHUser user;
  const UserView({super.key, required this.user});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {

  String _iTok(int i) {
    double x;
    if (i > 1000000) {
      x = double.parse((i / 1000000).toStringAsFixed(1));
      return "${x}m";
    } else if (i > 1000 && i < 1000000) {
      x = double.parse((i / 1000).toStringAsFixed(1));
      return "${x}k";
    } else {
      x = double.parse(i.toStringAsFixed(0));
      return "$x";
    }
  }

  List<Widget> _generateRepositories(List<GHRepository> repos) {
    List<Widget> items = [];
    for(GHRepository repo in repos) {
      items.add(
        StandardCard(innerContainer: Container(
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(foregroundImage: NetworkImage(repo.owner.details["avatar"]),),
                  const SizedBox(width: 2.0,),
                  Text(repo.owner.name, style: const TextStyle(fontSize: 16.0),),
                ],
              ),
              const SizedBox(height: 12.0,),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(repo.name.toString(), style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 24.0),),
              ),
              const SizedBox(height: 8.0,),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  repo.misc_details["description"] == null ? "" : repo.misc_details["description"].toString(),
                ),
              ),
              const SizedBox(height: 8.0,),
              Row(
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        size: 16.0,
                      ),
                      const SizedBox(width: 2.0),
                      Text(_iTok(repo.misc_details["stars"]), style: const TextStyle(fontWeight: FontWeight.w300),),
                    ],
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  Row(
                    children: [
                      Text(
                        "${repo.misc_details["language"]}",
                        style: const TextStyle(fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.code,
                        weight: 0.1,
                      ),
                      Text(
                        " ${_iTok(repo.misc_details["loc"])} lines",
                        style: const TextStyle(fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ), routeDestination: RepositoryView(repository: repo))
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Container(
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
                expandedHeight: 180.0,
                collapsedHeight: kToolbarHeight,
                title: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
                  final isCollapsed = constraints.maxHeight <= kToolbarHeight;
                  return isCollapsed ? Text("${widget.user.name}/") : const Text("");
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
                        Row(
                          children: [
                            CircleAvatar(
                              foregroundImage: NetworkImage(widget.user.details["avatar"]),
                              radius: 36.0,
                            ),
                            const SizedBox(
                              width: 12.0,
                            ),
                            Flexible(
                              child: Text(
                                widget.user.name,
                                overflow: TextOverflow.fade,
                                style: const TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            const SizedBox(
                              width: 16.0,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverList(delegate: SliverChildListDelegate(
                <Widget>[
                  const SizedBox(
                    width: double.infinity,
                    height: 12.0,
                  ),
                  const Text(
                    "  Repositories",
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 24.0),
                  ),
                  FutureBuilder(
                      future:
                          GithubDataController(authToken: globals.github_creds)
                              .fetchUserRepositories(widget.user),
                      builder: (context, snapshot) {
                        if(snapshot.connectionState == ConnectionState.done && snapshot.data != null) {
                          return Column(
                            children: _generateRepositories(snapshot.data!),
                          );
                        }
                        return Column(
                          children: [
                            CircularProgressIndicator(),
                          ],
                        );
                      } ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
