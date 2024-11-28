import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class StdCardNoPush extends StatefulWidget {
  final Widget child;
  const StdCardNoPush({super.key, required this.child});

  @override
  State<StdCardNoPush> createState() => _StdCardNoPushState();
}

class _StdCardNoPushState extends State<StdCardNoPush> {

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(
          sigmaX: 1.0,
          sigmaY: 1.0,
        ),
        child: Material(
          color: Colors.transparent,
          elevation: 20,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.2),
                border: Border.symmetric(
                    horizontal: BorderSide(width: 0.25, color: Colors.white.withAlpha(200)),
                    vertical: BorderSide(width: 0.45, color: Colors.white.withAlpha(200))),
                borderRadius: BorderRadius.circular(6.0)
            ),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
