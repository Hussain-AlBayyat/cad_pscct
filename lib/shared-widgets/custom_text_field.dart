import 'package:flutter/material.dart';
import 'package:pscct/size_config.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({this.hint, Key? key}) : super(key: key);
  final String? hint;
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(getProportionateScreenWidth(12)),
          borderSide:
              BorderSide(width: 1, color: Color(0xFF323232)), //<-- SEE HERE
        ),
      ),
    );
  }
}
