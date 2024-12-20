import 'package:flutter/material.dart';
import 'package:github_plus_plus/components/info_page_topbar.dart';
import 'package:github_plus_plus/components/standard_card.dart';
import 'package:github_plus_plus/controller/github_data_controller.dart';
import 'package:github_plus_plus/models/gh_repository.dart';
import 'package:github_plus_plus/view/file/file_view.dart';
import 'package:logger/logger.dart';
class FilesView extends StatefulWidget {
  final GHRepository repository;
  const FilesView({super.key, required this.repository});

  @override
  State<FilesView> createState() => _FilesViewState();
}

class _FilesViewState extends State<FilesView> {

  Logger logger = Logger();

  List<Widget> _generateList(Map<String, String> files) {
    logger.i("Starting for ${files.toString()}");
    List<Widget> widgetList = [];
    for (var file in files.keys) {
      logger.d(file);
      widgetList.add(StandardCard(
          innerContainer: Container(
            child: Row(
              children: [
                Icon(Icons.file_copy_outlined),
                SizedBox(width: 8.0,),
                Text(file.toString()),
              ],
            ),
          ),
          routeDestination: FileView(url: files[file]!, fileName: file,)));
    }
    logger.i("Finished ${widgetList.length.toString()}");
    return widgetList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          InfoPageTopbar(title: "Files",),
          SizedBox(height: 16.0, width: 24.0,),
          FutureBuilder(future: GithubDataController().fetchRepositoryFiles(widget.repository), builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
              return Expanded(
                child: ListView(
                  children: _generateList(snapshot.data!),
                ),
              );
            }
            return Column(
              children: [
                CircularProgressIndicator(),
              ],
            );
          }),
        ],
      ),
    );
  }
}
