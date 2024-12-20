import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:github_plus_plus/components/info_page_topbar.dart';
import 'package:github_plus_plus/components/standard_card_2.dart';
import 'package:github_plus_plus/controller/github_data_controller.dart';

class FileView extends StatefulWidget {
  final String url;
  final String fileName;
  const FileView({super.key, required this.url, required this.fileName});

  @override
  State<FileView> createState() => _FileViewState();
}

class _FileViewState extends State<FileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          InfoPageTopbar(title: "${widget.fileName}",),
          Container(
            child: FutureBuilder(future: GithubDataController().fetchFile(widget.url), builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.done && snapshot.hasData!) {
                return Expanded(child: ListView(
                  children: [
                    StdCardNoPush(child: Html(data: snapshot.data!, style: {
                      "p" : Style(color: Colors.white)
                    },))
                  ],
                ));
              }
              return const Column(
                children: [
                  CircularProgressIndicator()
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}
