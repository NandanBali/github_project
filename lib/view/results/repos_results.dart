import 'package:flutter/material.dart';
import 'package:github_plus_plus/view/loading/loading.dart';
import 'package:github_plus_plus/view/results/results_fetcher.dart';
import 'package:github_plus_plus/view/search/search.dart';

class ReposResultsView extends StatefulWidget {
  final String query;
  const ReposResultsView({super.key, required this.query});

  @override
  State<ReposResultsView> createState() => _ReposResultsViewState();
}

class _ReposResultsViewState extends State<ReposResultsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 48.0, left: 16.0, bottom: 16.0, right: 16.0),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.05),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(Icons.arrow_back_ios),
                ),
                const SizedBox(width: 8.0,),
                Flexible(child: Text("Repositories for \"${widget.query}\"", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0), overflow: TextOverflow.ellipsis,)),
                const SizedBox(width: 8.0,),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchView()));
                  },
                  child: Icon(Icons.search),
                ),
              ],
            ),
          ),
          SizedBox(width: double.infinity),
          FutureBuilder(future: ResultsFetcher().getReposResultWidgets(widget.query), builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.done && snapshot.data != null) {
              print("done");
              return Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/images/space_bg3.jpg"), fit: BoxFit.fill)
                  ),
                  child: ListView(
                    children: snapshot.data!,
                  ),
                ),
              );
            } else {
              return const Expanded(child: LoadingWidget());
            }
          })
        ],
      ),
    );
  }
}
