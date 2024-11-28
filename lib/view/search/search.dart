import 'package:flutter/material.dart';
import 'package:github_plus_plus/controller/caching/search_caching.dart';
import 'package:github_plus_plus/view/results/repos_results.dart';
import 'package:github_plus_plus/view/results/user_results.dart';
import 'package:logger/logger.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SearchCaching().initializeIsar();
    logger.d("Initialized isar");
  }

  void _handleCachedPaths(String searchQuery, String queryType) {
    if(queryType == "Repository") {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ReposResultsView(query: searchQuery)));
    } else if(queryType == "User") {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => UserResults(query: searchQuery)));
    }
  }

  Icon _generateCachedPathIcon(String queryType) {
    if(queryType == "Repository") {
      return Icon(Icons.book);
    } else if(queryType == "User") {
      return Icon(Icons.person);
    }
    return Icon(Icons.question_mark);
  }

  final TextEditingController _controller = TextEditingController();
  bool _showRecents = true;
  var logger = Logger();

  List<Widget> _generateList() {
    List<Widget> l = [];

    l.add(ListTile(
      leading: const Icon(Icons.code),
      title: Text("Code with ${_controller.text.toString()}"),
      onTap: () {

      },
    ));
    l.add(ListTile(
      leading: const Icon(Icons.book),
      title: Text("Repositories with ${_controller.text.toString()}"),
      onTap: () {
        SearchCaching().cacheQuery(_controller.text, "Repository");
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                ReposResultsView(query: _controller.text.toString())));
      },
    ));
    l.add(ListTile(
      leading: const Icon(Icons.error),
      title: Text("Issues with ${_controller.text.toString()}"),
      onTap: () {},
    ));
    l.add(ListTile(
      leading: const Icon(Icons.person),
      title: Text("People with ${_controller.text.toString()}"),
      onTap: () {
        SearchCaching().cacheQuery(_controller.text, "User");
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                UserResults(query: _controller.text.toString())));
      },
    ));
    return l;
  }

  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 48.0, bottom: 16.0, right: 16.0, left: 16.0),
            color: Colors.black87,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back_ios),
                  ),
                ),
                Expanded(
                    flex: 6,
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                          hintText: "Search Github",
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                          ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(color: Colors.blueGrey, width: 2.5),
                        ),
                        focusColor: Colors.white,
                      ),
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          setState(() {
                            _showRecents = false;
                          });
                        } else if (value.isEmpty) {
                          setState(() {
                            _showRecents = true;
                          });
                        }
                      },
                      onSubmitted: (value) {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ReposResultsView(query: _controller.text)));
                      },
                    )),
              ],
            ),
          ),
          _showRecents ? StreamBuilder(stream: SearchCaching().getQueriesStream(), builder: (context, snapshot) {
            if(snapshot.hasData && snapshot.data != null) {
              return Expanded(
                child: ListView.builder(itemCount: snapshot.data!.length, itemBuilder: (BuildContext context, int i) {
                  int index = snapshot.data!.length - i - 1;
                  return ListTile(
                    onTap: () {
                      _handleCachedPaths(snapshot.data!.elementAt(index).searchQuery, snapshot.data!.elementAt(index).queryType);
                    },
                    leading: _generateCachedPathIcon(snapshot.data!.elementAt(index).queryType),
                    title: Text("${snapshot.data!.elementAt(index).queryType}: ${snapshot.data!.elementAt(index).searchQuery}"),
                    trailing: GestureDetector(
                      onTap: () {
                        SearchCaching().removeQuery(snapshot.data!.elementAt(index).id);
                      },
                      child: Icon(Icons.close),
                    ),
                  );
                }),
              );
            } else {
              if(snapshot.hasError) {
                logger.d(snapshot.error!.toString());
              }
              return const CircularProgressIndicator();
            }
          }) : Column(children: _generateList(),),
        ],
      ),
    );
  }
}
