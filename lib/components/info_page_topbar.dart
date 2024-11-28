import 'package:flutter/material.dart';
import 'package:github_plus_plus/view/search/search.dart';

class InfoPageTopbar extends StatefulWidget {
  final String? title;
  const InfoPageTopbar({super.key, this.title = null});

  @override
  State<InfoPageTopbar> createState() => _InfoPageTopbarState();
}

class _InfoPageTopbarState extends State<InfoPageTopbar> {
  @override
  Widget build(BuildContext context) {
    double _y = MediaQuery.of(context).size.height;
    double _x = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(top: 48.0, left: 24.0, right: 24.0, bottom: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back_ios),
          ),
          Flexible(child: Text(widget.title == null ? " " : widget.title!),),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchView()));
            },
            child: Icon(Icons.search),
          )
        ],
      ),
    );
  }
}
