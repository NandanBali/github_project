import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class StandardCard extends StatefulWidget {
  final Widget innerContainer;
  final routeDestination;
  const StandardCard({super.key, required this.innerContainer, required this.routeDestination});

  @override
  State<StandardCard> createState() => _StandardCardState();
}

class _StandardCardState extends State<StandardCard> {

  double _scale = 1.00;

  void _onTapDown() {
    setState(() {
      _scale = 0.965;
    });
  }
  void _onTapUp() {
    setState(() {
      _scale = 1.00;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        _onTapDown();
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => widget.routeDestination));
        },
      onTapUp: (_) => _onTapUp(),
      onTapCancel: () => _onTapUp(),
      child: AnimatedScale(
        scale: _scale,
        duration: const Duration(milliseconds: 30),
        child: ClipRRect(
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
                child: widget.innerContainer,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
