import 'package:flutter/material.dart';

import '../size_config.dart';

class TextIconButton extends StatelessWidget {
  const TextIconButton(
      {required this.text, required this.icon, required this.onPress, Key? key})
      : super(key: key);
  final String? text;
  final String? icon;
  final Function() onPress;
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {},
      icon: Image.asset(
        icon ?? "",
        height: getProportionateScreenHeight(30),
      ),
      label: Text(text ?? ""),
      style: TextButton.styleFrom(
        alignment: Alignment.centerLeft,
        minimumSize: Size.fromHeight(50),
        foregroundColor: Color(0xFF323232),
        padding: EdgeInsets.all(getProportionateScreenHeight(16)),
        textStyle: TextStyle(
          fontSize: getProportionateScreenHeight(16),
        ),
      ),
    );
  }
}
