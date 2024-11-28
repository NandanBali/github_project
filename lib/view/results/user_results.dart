import 'package:flutter/material.dart';
import 'package:github_plus_plus/view/loading/loading.dart';
import 'package:github_plus_plus/view/results/results_fetcher.dart';
import 'package:github_plus_plus/view/search/search.dart';

class UserResults extends StatefulWidget {
  final query;
  const UserResults({super.key, required this.query});

  @override
  State<UserResults> createState() => _UserResultsState();
}

class _UserResultsState extends State<UserResults> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 48.0, left: 16.0, bottom: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Icon(Icons.arrow_back_ios),
                ),
                const SizedBox(width: 8.0,),
                Flexible(child: Text("Users for \"${widget.query}\"", style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0), overflow: TextOverflow.ellipsis,)),
                const SizedBox(width: 8.0,),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SearchView()));
                  },
                  child: const Icon(Icons.search),
                ),
              ],
            ),
          ),
          const SizedBox(width: double.infinity),
          FutureBuilder(future: ResultsFetcher().getUserResultWidgets(widget.query), builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.done && snapshot.data != null) {
              print("done");
              return Expanded(
                child: Container(
                  decoration: const BoxDecoration(
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
