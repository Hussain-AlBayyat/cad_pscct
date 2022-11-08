import 'package:flutter/material.dart';
import 'package:pscct/size_config.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({required this.text, required this.onPress, Key? key})
      : super(key: key);
  final String text;
  final Function() onPress;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      child: Text(text),
      style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF323232)),
          minimumSize: MaterialStateProperty.all(
            Size.fromHeight(50),
          ),
          textStyle: MaterialStateProperty.all(
              TextStyle(fontSize: getProportionateScreenHeight(16))),
          padding: MaterialStateProperty.all(
              EdgeInsets.all(getProportionateScreenHeight(16))),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(getProportionateScreenHeight(12)),
          ))),
    );
  }
}
