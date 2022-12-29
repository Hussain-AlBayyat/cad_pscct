import 'package:flutter/material.dart';
import 'package:no_context_navigation/no_context_navigation.dart';
import 'package:pscct/models/assets.dart';
import 'package:pscct/models/dialog_controller.dart';
import 'package:pscct/router.dart';
import 'package:pscct/services/auth_service.dart';
import 'package:pscct/shared-widgets/loading_circular.dart';
import 'package:pscct/shared-widgets/text_icon_button.dart';
import 'package:pscct/size_config.dart';

import '../../shared-widgets/default_widgets/default_scaffold.dart';
import '../../shared-widgets/round_button.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  static const buttonsList = [
    // {
    //   "text": "Account",
    //   "icon": Assets.accountIcon,
    // },
    // {
    //   "text": "Privacy & Security",
    //   "icon": Assets.privacyIcon,
    // },
    {
      "text": "Help & Support",
      "icon": Assets.supportIcon,
      "extra":
          "SGE.30015815.SUPPLYCHAINCONTROLTOWERTEAM@Exchange.Aramco.com.sa",
      "description":
          "If you have questions or require further clarification, please contact Procurement & Supply Chain Control Tower (PSCCT) at e-mail address:"
    },
    /*{
      "text": "Dark Mood",
      "icon": Assets.supportIcon,
    },*/
    {
      "text": "About",
      "icon": Assets.aboutIcon,
      "description":
          "The PSCCT is a strategic initiative designed to transform the Procurement and Supply Chain Management and its operations by integrating people and processes with state-of-t technologies and solutions, unlocking huge potential for value creation. This center is considered one of the catalysts for becoming the most digitalized company in the energy industry. The value that the center generates to the operation is significant, including:\n\n-Unlock value from big data\n\n-Mitigate Supply Chain disruption risks with advanced prediction analysis capabilities Monitor and act on key business metrics and events across the Supply Chain in real time\n\n-Prepare Supply Chain workforces for the digitalized future\n\n-Enable Supply Chain Management to make informed decisions timely Enable collaboration framework between all stakeholders\n\n-Please note that below is an example of the format ken from PSCCT website"
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
                        onPress: () {
                          print('test');
                          DialogController.showPopup(
                              button["text"]!,
                              button["description"]!,
                              dialogBody: SelectableText(
                                button["extra"] ?? "",
                                style: TextStyle(color: Colors.blue),
                              ),
                              context);
                        },
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
              onPress: () async {
                DialogController.showPopup(
                    "Please Wait", "logging you out...", context,
                    dialogBody: LoadingCircular());
                bool isLoggedOut = await AuthService.logout();
                if (isLoggedOut) {
                  //Navigator.pop(context);
                  navService.pushReplacementNamed(AppRouter.loginRoute);
                } else {}
              }),
        ),
        Spacer(
          flex: 2,
        ),
      ],
    );
  }
}
