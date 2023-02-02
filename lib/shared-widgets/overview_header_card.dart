import 'package:flutter/material.dart';
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
    return GestureDetector(
      onTap: () => DialogController.showPopup(
        report.Title,
        report.Description,
        context,
      ),
      child: CustomCard(
        linearGradiant: AppTheme.menuItemGradient,
        padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(18),
            vertical: getProportionateScreenHeight(16)),
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
                                  fontSize: getProportionateScreenHeight(18)),
                            ),
                          ),
                          leading: report.Category == "LG"
                              ? Image.asset(
                                  Assets.hashtagIcon,
                                )
                              : Image.asset(
                                  Assets.dollarIcon,
                                ),
                          subtitle: Text(
                            "${Helper.compactNumber2(report.RawData.toList()[index].values.last).toString()} ${report.Uom ?? ""}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: getProportionateScreenHeight(24)),
                          ),
                        ),
                        if (index != report.RawData.length - 1)
                          Divider(
                            height: 8,
                            thickness: 0.7,
                            color: Colors.white.withOpacity(0.3),
                          ),
                      ],
                    ))
          ],
        ),
      ),
    );
  }
}
