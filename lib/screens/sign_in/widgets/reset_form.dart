import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pscct/blocs/login_bloc/login_bloc.dart';
import 'package:pscct/blocs/login_bloc/login_state.dart';
import 'package:pscct/size_config.dart';

import '../../../shared-widgets/custom_text_field.dart';
import '../../../shared-widgets/round_button.dart';

class ResetForm extends StatelessWidget {
  const ResetForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginCubit = BlocProvider.of<LoginCubit>(context);
    return BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is! Reset) {
            return Navigator.pop(context);
          }
        },
        builder: (context, state) => state.maybeWhen(
            reset: (url) => Column(
                  children: [
                    CustomTextField(
                      label: "Url",
                      initialValue: url,
                      onTextChanged: loginCubit.urlChanged,
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(32),
                    ),
                    RoundButton(
                        text: "Update",
                        onPress: loginCubit.updateEnvironmentUrl),
                  ],
                ),
            orElse: () => Container()));
  }
}
