import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pscct/blocs/login_bloc/login_bloc.dart';

import '../../../blocs/login_bloc/login_state.dart';
import '../../../shared-widgets/custom_text_field.dart';

class UserName extends StatelessWidget {
  const UserName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) => CustomTextField(
        hint: "Username",
        label: "Username",
        initialValue: context.read<LoginCubit>().typedUserName,
        maxLine: 1,
        prefix: Icon(Icons.person),
        onTextChanged: context.read<LoginCubit>().usernameChanged,
      ),
    );
  }
}
