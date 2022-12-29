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
        SizedBox(
          height: getProportionateScreenHeight(20),
        ),
        Center(
          child: Wrap(
            spacing: getProportionateScreenHeight(26),
            runSpacing: getProportionateScreenHeight(20),
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
          ),
        ),
      ],
    );
  }
}
