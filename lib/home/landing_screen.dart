import 'package:flutter/material.dart';
import 'package:pscct/home/home_widgets/landing_headline.dart';
import 'package:pscct/home/home_widgets/landing_menu.dart';
import 'package:pscct/shared-widgets/custom_card.dart';

import 'package:pscct/size_config.dart';

import '../models/assets.dart';
import 'default_widgets/default_scaffold.dart';

class LandingScreen extends StatelessWidget {
  LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return DefaultScaffold(
      showAppBar: true,
      showBackButton: false,
      background: Image.asset(
        height: getProportionateScreenHeight(500),
        Assets.backgroundPng,
        fit: BoxFit.cover,
        width: SizeConfig.screenWidth,
      ),
      //background: const HomeBackground(),
      body: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 36),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(getProportionateScreenWidth(40)),
                topRight: Radius.circular(getProportionateScreenWidth(40))),
          ),
          child: Column(
            children: [
              HomeHeadline(),
              HomeMenu(),
              SizedBox(
                height: getProportionateScreenHeight(16),
              ),
            ],
          ),
        )
      ],
    );
  }
}
