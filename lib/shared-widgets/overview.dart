import 'package:flutter/material.dart';
import 'package:pscct/shared-widgets/report_button.dart';

import 'package:pscct/size_config.dart';

import 'overview_header_card.dart';

class Overview extends StatelessWidget {
  final List<String> titles;
  final List<Map> widgets;

  const Overview({required this.widgets, required this.titles, Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //ImageInimation(),
        OverviewHeaderCard(
          spendsTitle: titles,
        ),
        SizedBox(
          height: getProportionateScreenHeight(20),
        ),
        Center(
          child: Wrap(
            spacing: getProportionateScreenHeight(20),
            runSpacing: getProportionateScreenHeight(20),
            children: [
              ...List.generate(
                widgets.length,
                (index) => ReportButton(
                  buttonText: widgets[index]["title"],
                  dialogWidget: widgets[index]["widget"],
                  buttonIcon: widgets[index]["icon"],
                  description: widgets[index]["description"],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
