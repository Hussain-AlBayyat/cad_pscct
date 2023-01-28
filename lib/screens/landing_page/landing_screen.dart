import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pscct/screens/landing_page/widgets/landing_headline.dart';
import 'package:pscct/screens/landing_page/widgets/landing_menu.dart';
import 'package:pscct/size_config.dart';

import '../../blocs/settings_bloc/settings_bloc.dart';
import '../../blocs/settings_bloc/settings_state.dart';
import '../../models/assets.dart';
import '../../shared-widgets/default_widgets/default_scaffold.dart';

class LandingPageScreen extends StatelessWidget {
  LandingPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return DefaultScaffold(
      showAppBar: true,
      showSettings: true,
      showBackButton: false,
      background: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) => Image.asset(
          SizeConfig.screenWidth > 720
              ? SizeConfig.orientation == Orientation.landscape
                  ? state.isDarkMode
                      ? Assets.ipad_dark_image_landscape
                      : Assets.ipad_image_landscape
                  : state.isDarkMode
                      ? Assets.ipad_dark_image_portrait
                      : Assets.ipad_image_portrait
              : state.isDarkMode
                  ? Assets.backgroundDark
                  : Assets.backgroundLight,
          fit: BoxFit.cover,
          //height: SizeConfig.screenHeight * 0.6,
          width: SizeConfig.screenWidth,
        ),
      ),
      //background: const HomeBackground(),
      body: [
        Container(
          width: getProportionateScreenWidth(SizeConfig.screenWidth * .8),
          margin:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(24)),
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
              vertical: getProportionateScreenHeight(36)),
          decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(getProportionateScreenWidth(40)),
                topRight: Radius.circular(getProportionateScreenWidth(40))),
          ),
          child: OrientationBuilder(
            builder: (context, _) => Column(
              children: [
                LandingPageHeadline(),
                LandingPageMenu(),
                SizedBox(
                  height: getProportionateScreenHeight(16),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
