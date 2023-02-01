import 'package:flutter/material.dart';
import 'package:no_context_navigation/no_context_navigation.dart';
import 'package:pscct/Theme/theme.dart';
import 'package:pscct/constants.dart';
import 'package:pscct/size_config.dart';

import '../../../models/assets.dart';
import '../../../router.dart';

class LandingPageMenu extends StatelessWidget {
  LandingPageMenu({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> menuItems = [
    {"title": Constants.procurement, "icon": Assets.blueProcurementIcon},
    {"title": Constants.inventory, "icon": Assets.inventoryIcon},
    {"title": Constants.wareHouseAndLogistics, "icon": Assets.blueWhIcon},
    {"title": Constants.globalMarketReport, "icon": Assets.globalMarketIcon}
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: getProportionateScreenHeight(20),
      runSpacing: getProportionateScreenHeight(20),
      children: [
        ...List.generate(
          menuItems.length,
          (index) => Container(
            width: getProportionateScreenWidth(120),
            height: getProportionateScreenHeight(120),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(getProportionateScreenWidth(40)),
                  bottomRight:
                      Radius.circular(getProportionateScreenWidth(40))),
              gradient: AppTheme.menuItemGradient,
            ),
            child: TextButton(
              onPressed: () => onMenuPress(index),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Spacer(
                    flex: 5,
                  ),
                  Image.asset(
                    menuItems[index]["icon"],
                    width: getProportionateScreenHeight(40),
                    height: getProportionateScreenHeight(40),
                    color: Colors.white,
                  ),
                  Spacer(),
                  Text(menuItems[index]["title"],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: getProportionateScreenHeight(16),
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  Spacer(
                    flex: 5,
                  ),
                ],
              ),
            ),
          ),
        ).toList()
      ],
    );
  }

  onMenuPress(int index) {
    switch (index) {
      case 3:
        return navService.pushNamed(AppRouter.newsFeedsRoute);
      default:
        return navService.pushNamed(AppRouter.homeRoute, args: index);
    }
  }
}
