import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:pscct/models/assets.dart';

class LoadingCircular extends StatefulWidget {
  const LoadingCircular({this.width = 50, this.height = 50, Key? key})
      : super(key: key);
  final double width, height;
  @override
  State<LoadingCircular> createState() => _LoadingCircularState();
}

class _LoadingCircularState extends State<LoadingCircular>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController =
      AnimationController(vsync: this, duration: Duration(seconds: 1))
        ..repeat();

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (_, child) {
        return Transform.rotate(
          angle: animationController.value * 2 * math.pi,
          child: Image.asset(
            Assets.loadingImage,
            width: widget.width,
            height: widget.height,
          ),
        );
      },
    );
  }
}
