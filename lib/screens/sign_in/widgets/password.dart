import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/login_bloc/login_bloc.dart';
import '../../../shared-widgets/custom_text_field.dart';

class Password extends StatelessWidget {
  const Password({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginCubit = BlocProvider.of<LoginCubit>(context);
    return CustomTextField(
      hint: "Password",
      label: "Password",
      initialValue: "",
      maxLine: 1,
      prefix: Icon(Icons.password),
      isSecureText: true,
      onTextChanged: loginCubit.passwordChanged,
    );
  }
}
