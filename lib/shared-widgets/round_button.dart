import 'package:flutter/material.dart';
import 'package:pscct/size_config.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({required this.text, this.onPress, Key? key})
      : super(key: key);
  final String text;
  final Function()? onPress;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      child: Text(text),
      style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          disabledBackgroundColor: Theme.of(context).disabledColor,
          backgroundColor: Theme.of(context).primaryColor,
          minimumSize: Size.fromHeight(getProportionateScreenHeight(50)),
          textStyle: TextStyle(fontSize: getProportionateScreenHeight(16)),
          padding: EdgeInsets.all(getProportionateScreenHeight(16)),
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(getProportionateScreenHeight(12)),
          )),
    );
  }
}
