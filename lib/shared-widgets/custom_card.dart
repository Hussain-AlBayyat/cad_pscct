import 'package:flutter/material.dart';

import '../size_config.dart';

class CustomCard extends StatelessWidget {
  final EdgeInsets? margin;
  final Widget child;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final LinearGradient? linearGradiant;

  const CustomCard(
      {Key? key,
      this.margin,
      required this.child,
      this.padding,
      this.color,
      this.linearGradiant,
      this.borderRadius = 12})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        gradient: linearGradiant,
        borderRadius:
            BorderRadius.circular(getProportionateScreenHeight(borderRadius)),
        boxShadow: [
          BoxShadow(
              color: Color(0xFF0000001A).withOpacity(0.18),
              offset: const Offset(0, 3),
              blurRadius: 10)
        ],
      ),
    );
  }
}
