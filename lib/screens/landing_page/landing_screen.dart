import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pscct/screens/landing_page/widgets/landing_headline.dart';
import 'package:pscct/screens/landing_page/widgets/landing_menu.dart';
import 'package:pscct/size_config.dart';

import '../../models/assets.dart';
import '../../shared-widgets/default_widgets/default_scaffold.dart';

class LandingPageScreen extends StatelessWidget {
  LandingPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    print(SizeConfig.screenHeight);
    return DefaultScaffold(
      showAppBar: true,
      showSettings: true,
      showBackButton: false,
      background: Image.asset(
        SizeConfig.screenWidth > 720
            ? SizeConfig.orientation == Orientation.landscape
                ? Assets.ipad_image_landscape
                : Assets.ipad_image_portrait
            : Assets.backgroundPng,
        fit: BoxFit.cover,
        //height: SizeConfig.screenHeight * 0.6,
        width: SizeConfig.screenWidth,
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
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(getProportionateScreenWidth(40)),
                topRight: Radius.circular(getProportionateScreenWidth(40))),
          ),
          child: Column(
            children: [
              LandingPageHeadline(),
              LandingPageMenu(),
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
