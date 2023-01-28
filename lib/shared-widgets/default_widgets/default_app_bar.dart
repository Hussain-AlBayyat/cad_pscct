import 'package:flutter/material.dart';
import 'package:no_context_navigation/no_context_navigation.dart';
import 'package:pscct/size_config.dart';

import '../../../router.dart';

class DefaultAppBar extends StatelessWidget {
  const DefaultAppBar(
      {this.title = "",
      this.showBackButton = true,
      this.showSettings = false,
      Key? key})
      : super(key: key);
  final String title;

  final bool showBackButton, showSettings;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: showBackButton
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.end,
        children: [
          if (showBackButton)
            IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: Theme.of(context).highlightColor,
                  size: 32,
                )),
          if (title.isNotEmpty)
            Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Theme.of(context).highlightColor),
            ),
          Visibility(
            visible: showSettings,
            replacement: SizedBox(
              width: getProportionateScreenWidth(32),
            ),
            child: IconButton(
                onPressed: () => navService.pushNamed(AppRouter.settingsRoute),
                icon: Icon(
                  Icons.settings_outlined,
                  color: showBackButton ? Colors.black : Colors.white,
                  size: 32,
                )),
          )
        ],
      ),
    );
  }
}
