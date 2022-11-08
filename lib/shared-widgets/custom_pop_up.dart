import 'package:flutter/material.dart';

class CustomPopUp extends StatelessWidget {
  const CustomPopUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
