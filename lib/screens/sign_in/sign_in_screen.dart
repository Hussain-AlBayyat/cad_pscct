import 'package:flutter/material.dart';
import 'package:no_context_navigation/no_context_navigation.dart';
import 'package:pscct/models/assets.dart';
import 'package:pscct/router.dart';
import 'package:pscct/screens/sign_in/widgets/password.dart';
import 'package:pscct/screens/sign_in/widgets/user_name.dart';
import 'package:pscct/size_config.dart';

import '../../shared-widgets/default_widgets/default_scaffold.dart';
import '../../shared-widgets/round_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      //enablePaging: true,
      padding: EdgeInsets.all(getProportionateScreenWidth(20)),
      showAppBar: false,
      body: [
        Spacer(),
        Center(
          child: Image.asset(
            Assets.logo,
            height: getProportionateScreenHeight(80),
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(90),
        ),
        UserName(),
        SizedBox(
          height: getProportionateScreenHeight(24),
        ),
        Password(),
        SizedBox(
          height: getProportionateScreenHeight(45),
        ),
        RoundButton(
          text: "Login",
          onPress: () => navService.pushNamed(AppRouter.landingPageRoute),
        ),
        SizedBox(
          height: getProportionateScreenHeight(45),
        ),
        Center(
          child: Image.asset(
            Assets.faceIdIcon,
            height: getProportionateScreenHeight(112),
          ),
        ),
        Spacer(
          flex: 2,
        ),
      ],
    );
  }
}
