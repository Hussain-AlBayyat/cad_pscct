import 'package:flutter/material.dart';

import '../models/assets.dart';

class ImageInimation extends StatefulWidget {
  ImageInimation({Key? key}) : super(key: key);

  @override
  State<ImageInimation> createState() => _ImageInimationState();
}

class _ImageInimationState extends State<ImageInimation>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animation;
  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animation = Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0))
        .animate(_animationController);
    _animationController.forward().whenComplete(() {
      // when animation completes, put your code here
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: AnimatedContainer(
        height: 200,
        width: 1000,
        alignment: Alignment.topLeft,
        duration: Duration(seconds: 2),
        child: Image(
          height: 200,
          width: 200,
          fit: BoxFit.cover,
          image: AssetImage(Assets.backgroundLight),
        ),
      ),
    );
  }
}
