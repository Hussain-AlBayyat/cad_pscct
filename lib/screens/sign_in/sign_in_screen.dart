import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:no_context_navigation/no_context_navigation.dart';
import 'package:pscct/blocs/login_bloc/login_bloc.dart';
import 'package:pscct/blocs/login_bloc/login_state.dart';
import 'package:pscct/models/assets.dart';
import 'package:pscct/screens/sign_in/widgets/password.dart';
import 'package:pscct/screens/sign_in/widgets/reset_form.dart';
import 'package:pscct/screens/sign_in/widgets/user_name.dart';
import 'package:pscct/size_config.dart';

import '../../models/dialog_controller.dart';
import '../../router.dart';
import '../../shared-widgets/default_widgets/default_scaffold.dart';
import '../../shared-widgets/round_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  double test = 1;
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      lowerBound: 0.2,
      upperBound: 1,
      duration: Duration(milliseconds: 800),
    )..repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginCubit = BlocProvider.of<LoginCubit>(context);

    return BlocConsumer<LoginCubit, LoginState>(listener: (context, state) {
      if (state is LoggedIn) {
        navService.pushNamedAndRemoveUntil(AppRouter.landingPageRoute);
      }
      if (state is Error && ModalRoute.of(context)?.isCurrent != true)
        Navigator.pop(context);

      if (state is Loading) DialogController.showFullDialog(context);
      if (state is Reset)
        DialogController.showPopup("Reset", "", context,
            dialogBody: ResetForm());
    }, builder: (context, state) {
      return DefaultScaffold(
        isScrollable: true,
        addSpacing: false,
        showSettings: true,
        showBackButton: false,
        padding: EdgeInsets.all(getProportionateScreenWidth(20)),
        showAppBar: true,
        body: [
          SizedBox(
            height: getProportionateScreenHeight(16),
          ),
          Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                  onPressed: () =>
                      navService.pushNamed(AppRouter.settingsRoute),
                  icon: Icon(
                    Icons.settings_outlined,
                    size: 32,
                  ))),
          SizedBox(
            height: getProportionateScreenHeight(SizeConfig.screenHeight * .04),
          ),
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
            height: getProportionateScreenHeight(24),
          ),
          if (state is Error)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                state.message,
                style: TextStyle(color: Colors.red, fontSize: 18),
              ),
            ),
          SizedBox(
            height: getProportionateScreenHeight(24),
          ),
          RoundButton(
            text: "Login",
            onPress: loginCubit.canLogin()
                ? () async {
                    await loginCubit.login();
                  }
                : null,
          ),
          SizedBox(
            height: getProportionateScreenHeight(45),
          ),
          //if (!loginCubit.isFirstTime)
          Center(
            child: GestureDetector(
              onTap: loginCubit.loginWithBiometric,
              child: ScaleTransition(
                scale: CurvedAnimation(
                    parent: animationController,
                    curve: Curves.fastLinearToSlowEaseIn),
                child: Image.asset(
                  Assets.faceIdIcon,
                  color: Theme.of(context).primaryColor,
                  height: getProportionateScreenHeight(112),
                ),
              ),
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(45),
          ),
          Text(
            "Version 1.0.0",
            style: TextStyle(color: Colors.grey[500]),
          )
        ],
      );
    });
  }
}
