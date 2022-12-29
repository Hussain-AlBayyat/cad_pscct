import 'package:flutter/material.dart';

import '../../../models/enums/echart_configurator.dart';
import '../../../shared-widgets/echarts/echart.dart';

class LostOpportunity extends StatelessWidget {
  LostOpportunity({required this.data, Key? key}) : super(key: key);
  final lostOpportunityData = [
    {"Year": "2020", "Value": 270.8},
    {"Year": "2021", "Value": 94.4},
    {"Year": "2022", "Value": 30.0}
  ];
  final List<Map> data;

  @override
  Widget build(BuildContext context) {
    return EChartCharts(
      data: data,
      name: "Lost Opportunity",
      configurations: [EChartConfigurator()],
    );

    /*SfCartesianChart(
      plotAreaBorderWidth: 0,
      primaryXAxis: CategoryAxis(
        labelIntersectAction: AxisLabelIntersectAction.wrap,
        majorTickLines: const MajorTickLines(width: 0),
        majorGridLines: const MajorGridLines(width: 0),
      ),
      primaryYAxis: NumericAxis(
        majorTickLines: const MajorTickLines(width: 0),
        majorGridLines: const MajorGridLines(width: 0),
      ),
      series: <LineSeries<Map, String>>[
        LineSeries<Map, String>(
            // Bind data source
            dataSource: lostOpportunityData,
            xValueMapper: (Map sales, _) => sales["Year"],
            yValueMapper: (Map sales, _) => sales["Value"],
            name: 'Average Process Time',
            color: Colors.green,
            markerSettings:
                const MarkerSettings(isVisible: true, color: Colors.green),
            // Enable data label
            dataLabelSettings: const DataLabelSettings(
              isVisible: true,
            )),
      ],
    );*/
  }
}
