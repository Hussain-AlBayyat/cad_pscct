import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pscct/blocs/login_bloc/login_state.dart';

import '../../../blocs/login_bloc/login_bloc.dart';
import '../../../shared-widgets/custom_text_field.dart';

class Password extends StatelessWidget {
  Password({Key? key}) : super(key: key);
  final editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
      return CustomTextField(
        hint: "Password",
        label: "Password",
        maxLine: 1,
        initialValue: context.read<LoginCubit>().typedPassword,
        prefix: Icon(Icons.password),
        isSecureText: true,
        onTextChanged: context.read<LoginCubit>().passwordChanged,
      );
    });
  }
}
