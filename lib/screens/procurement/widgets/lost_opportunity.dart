import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LostOpportunity extends StatelessWidget {
  LostOpportunity({Key? key}) : super(key: key);
  final lostOpportunityData = [
    {"Year": "2020", "Value": 270.8},
    {"Year": "2021", "Value": 94.4},
    {"Year": "2022", "Value": 30.0}
  ];

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
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
    );
  }
}
