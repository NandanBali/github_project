import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image(image: AssetImage("assets/images/rocket.gif"), fit: BoxFit.cover,),
    );
  }
}
