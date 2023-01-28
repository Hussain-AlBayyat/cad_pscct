import 'package:flutter/material.dart';
import 'package:pscct/models/pscct_report.dart';
import 'package:pscct/shared-widgets/report_button.dart';
import 'package:pscct/size_config.dart';

import 'overview_header_card.dart';

class Overview extends StatelessWidget {
  final List<PSCCTReport> reports;

  const Overview({required this.reports, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //ImageInimation(),
        if (reports.indexWhere((element) => element.IsCard) != -1)
          OverviewHeaderCard(
            report: reports.firstWhere((element) => element.IsCard),
          ),

        OrientationBuilder(builder: (context, _) {
          return GridView.count(
            shrinkWrap: true,
            padding: EdgeInsets.only(top: 16, bottom: 16),
            mainAxisSpacing: 20,
            physics: NeverScrollableScrollPhysics(),
            crossAxisSpacing: 20,
            crossAxisCount: 2,
            childAspectRatio:
                SizeConfig.screenWidth / SizeConfig.screenHeight * 2.5,
            children: [
              ...List.generate(
                reports
                    .where((element) => element.IsCard == false)
                    .toList()
                    .length,
                (index) => ReportButton(
                  pscctReport: reports
                      .where((element) => element.IsCard == false)
                      .toList()[index],
                ),
              ),
            ],
          );
        }),
      ],
    );
  }
}
