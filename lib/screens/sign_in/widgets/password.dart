import 'package:flutter/material.dart';

import '../../../shared-widgets/custom_text_field.dart';

class Password extends StatelessWidget {
  const Password({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hint: "Password",
    );
  }
}
