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
      onPressed: onPress,
      icon: Image.asset(
        icon ?? "",
        color: Theme.of(context).highlightColor,
        height: getProportionateScreenHeight(30),
      ),
      label: Text(
        text ?? "",
      ),
      style: TextButton.styleFrom(
        foregroundColor: Theme.of(context).highlightColor,
        alignment: Alignment.centerLeft,
        minimumSize: Size.fromHeight(50),
        padding: EdgeInsets.all(getProportionateScreenHeight(16)),
        textStyle: TextStyle(
          fontSize: getProportionateScreenHeight(16),
        ),
      ),
    );
  }
}
