import 'package:flutter/material.dart';

import '../../../shared-widgets/custom_text_field.dart';

class UserName extends StatelessWidget {
  const UserName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hint: "Username",
    );
  }
}
