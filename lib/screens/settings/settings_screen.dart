import 'package:flutter/material.dart';
import 'package:no_context_navigation/no_context_navigation.dart';
import 'package:pscct/models/assets.dart';
import 'package:pscct/router.dart';

import 'package:pscct/shared-widgets/text_icon_button.dart';
import 'package:pscct/size_config.dart';

import '../../shared-widgets/default_widgets/default_scaffold.dart';
import '../../shared-widgets/round_button.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  static const buttonsList = [
    {
      "text": "Account",
      "icon": Assets.accountIcon,
    },
    {
      "text": "Privacy & Security",
      "icon": Assets.privacyIcon,
    },
    {
      "text": "Help & Support",
      "icon": Assets.supportIcon,
    },
    {
      "text": "About",
      "icon": Assets.aboutIcon,
    }
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      //enablePaging: true,
      showAppBar: true,
      title: "Settings",
      body: [
        Spacer(),
        ...buttonsList
            .map((button) => Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(40)),
                  child: Column(
                    children: [
                      TextIconButton(
                        onPress: () {},
                        text: button["text"],
                        icon: button["icon"],
                      ),
                      Divider(
                        color: Colors.grey,
                      )
                    ],
                  ),
                ))
            .toList(),
        SizedBox(
          height: getProportionateScreenHeight(48),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenHeight(20)),
          child: RoundButton(
            text: "Logout",
            onPress: () => navService.pushNamed(AppRouter.loginRoute),
          ),
        ),
        Spacer(
          flex: 2,
        ),
      ],
    );
  }
}
