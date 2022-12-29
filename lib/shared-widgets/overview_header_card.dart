import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pscct/Theme/theme.dart';
import 'package:pscct/models/dialog_controller.dart';
import 'package:pscct/models/pscct_report.dart';

import '../helper.dart';
import '../models/assets.dart';
import '../size_config.dart';
import 'custom_card.dart';

class OverviewHeaderCard extends StatelessWidget {
  const OverviewHeaderCard({required this.report, Key? key}) : super(key: key);
  final PSCCTReport report;

  @override
  Widget build(BuildContext context) {
    var formatter = NumberFormat('###,000');
    return GestureDetector(
      onTap: () => DialogController.showPopup(
        report.Title,
        report.Description,
        context,
      ),
      child: CustomCard(
        linearGradiant: AppTheme.menuItemGradient,
        padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(32), vertical: 32),
        child: Column(
          children: [
            ...List.generate(
                report.RawData.length,
                (index) => Wrap(
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.all(0),
                          title: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: getProportionateScreenHeight(5)),
                            child: Text(
                              report.RawData.toList()[index].values.first,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: getProportionateScreenHeight(20)),
                            ),
                          ),
                          leading: Image.asset(Assets.dollarIcon),
                          subtitle: Text(
                            "\$${Helper.compactNumber2(report.RawData.toList()[index].values.last).toString()} ${report.Uom ?? ""}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: getProportionateScreenHeight(24)),
                          ),
                        ),
                        if (index != report.RawData.length - 1)
                          Divider(
                            height: 30,
                            thickness: 0.7,
                            color: Colors.white,
                          ),
                      ],
                    ))
          ],
        ),
      ),
    );
  }
}
