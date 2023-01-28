import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:no_context_navigation/no_context_navigation.dart';
import 'package:pscct/blocs/settings_bloc/settings_bloc.dart';
import 'package:pscct/blocs/settings_bloc/settings_state.dart';
import 'package:pscct/models/assets.dart';
import 'package:pscct/models/dialog_controller.dart';
import 'package:pscct/router.dart';
import 'package:pscct/services/auth_service.dart';
import 'package:pscct/shared-widgets/loading_circular.dart';
import 'package:pscct/shared-widgets/text_icon_button.dart';
import 'package:pscct/size_config.dart';

import '../../blocs/login_bloc/login_bloc.dart';
import '../../shared-widgets/default_widgets/default_scaffold.dart';
import '../../shared-widgets/round_button.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  static const buttonsList = [
    {
      "text": "Help & Support",
      "icon": Assets.supportIcon,
      "extra":
          "SGE.30015815.SUPPLYCHAINCONTROLTOWERTEAM@Exchange.Aramco.com.sa",
      "description":
          "If you have questions or require further clarification, please contact Procurement & Supply Chain Control Tower (PSCCT) at e-mail address:"
    },
    {
      "text": "About",
      "icon": Assets.aboutIcon,
      "description":
          "The PSCCT is a strategic initiative designed to transform the Procurement and Supply Chain Management and its operations by integrating people and processes with state-of-the art technologies and solutions, unlocking huge potential for value creation. This center is considered one of the catalysts for becoming the most digitalized company in the energy industry.\n\nThe value that the center generates to the operation is significant, including:\n-Unlock value from big data\n-Mitigate Supply Chain disruption risks with advanced prediction analysis capabilities\n-Monitor and act on key business metrics and events across the Supply Chain in real time\n-Prepare Supply Chain workforces for the digitalized future\n-Enable Supply Chain Management to make informed decisions timely\n-Enable collaboration framework between all stakeholders"
    }
  ];

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final loginCubit = BlocProvider.of<LoginCubit>(context);
    final settingsCubit = BlocProvider.of<SettingsCubit>(context);

    return DefaultScaffold(
      //enablePaging: true,
      showAppBar: true,
      title: "Settings",
      body: [
        Spacer(),
        ...SettingsScreen.buttonsList
            .map((button) => Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(40)),
                  child: Column(
                    children: [
                      TextIconButton(
                        onPress: () {
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
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(40)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Dark Mode",
                style: TextStyle(
                    fontSize: 18, color: Theme.of(context).highlightColor),
              ),
              BlocBuilder<SettingsCubit, SettingsState>(
                builder: (context, state) => Switch(
                  inactiveTrackColor: Colors.red,
                  activeTrackColor: Colors.green,
                  activeColor: Colors.green,
                  value: state.isDarkMode,
                  onChanged: (value) {
                    settingsCubit.changeTheme();
                  },
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(48),
        ),
        if (loginCubit.isLoggedIn())
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
                    loginCubit.logOut();
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

  @override
  void initState() {
    super.initState();
  }
}
