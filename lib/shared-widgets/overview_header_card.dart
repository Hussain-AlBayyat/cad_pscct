import 'package:flutter/material.dart';
import 'package:pscct/Theme/theme.dart';

import '../models/assets.dart';
import '../size_config.dart';
import 'custom_card.dart';
import 'package:intl/intl.dart';

class OverviewHeaderCard extends StatelessWidget {
  const OverviewHeaderCard({required this.spendsTitle, Key? key})
      : super(key: key);
  final List<String> spendsTitle;

  @override
  Widget build(BuildContext context) {
    var formatter = NumberFormat('###,000');
    return CustomCard(
      linearGradiant: AppTheme.menuItemGradient,
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(40), vertical: 47),
      child: Column(
        children: [
          ...List.generate(
              spendsTitle.length,
              (index) => Wrap(
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.all(0),
                        title: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: getProportionateScreenHeight(5)),
                          child: Text(
                            spendsTitle[index],
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: getProportionateScreenHeight(20)),
                          ),
                        ),
                        leading: Image.asset(Assets.dollarIcon),
                        subtitle: Text(
                          "\$${formatter.format(10000000)} MM",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: getProportionateScreenHeight(29)),
                        ),
                      ),
                      if (index != spendsTitle.length - 1)
                        Divider(
                          height: 30,
                          thickness: 0.7,
                          color: Colors.white,
                        ),
                    ],
                  ))
        ],
      ),
    );
  }
}
