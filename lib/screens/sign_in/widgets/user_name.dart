import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pscct/blocs/login_bloc/login_bloc.dart';

import '../../../shared-widgets/custom_text_field.dart';

class UserName extends StatelessWidget {
  const UserName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginCubit = BlocProvider.of<LoginCubit>(context);
    return CustomTextField(
      hint: "Username",
      maxLine: 1,
      label: "Username",
      prefix: Icon(Icons.person),
      initialValue: "",
      onTextChanged: loginCubit.usernameChanged,
    );
  }
}
