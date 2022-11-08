import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class EGRSProcessingTime extends StatelessWidget {
  EGRSProcessingTime({Key? key}) : super(key: key);
  final egrsData = [
    {"Month": "Sep 2021", "Value": 17.6, "Target": 10},
    {"Month": "Oct 2021", "Value": 21.4, "Target": 10},
    {"Month": "Nov 2021", "Value": 24.7, "Target": 10},
    {"Month": "Dec 2021", "Value": 17.4, "Target": 10},
    {"Month": "Jan 2022", "Value": 12.6, "Target": 10},
    {"Month": "Feb 2022", "Value": 15.9, "Target": 10},
    {"Month": "Mar 2021", "Value": 22.9, "Target": 10},
    {"Month": "APR 2022", "Value": 13.1, "Target": 10},
    {"Month": "May 2022", "Value": 15.0, "Target": 10},
    {"Month": "Jun 2021", "Value": 15.7, "Target": 10},
    {"Month": "Jul 2022", "Value": 15.1, "Target": 10},
    {"Month": "Aug 2022", "Value": 18.9, "Target": 10},
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
        labelIntersectAction: AxisLabelIntersectAction.wrap,
        interval: 5,
      ),
      legend: Legend(
          position: LegendPosition.top,
          isVisible: true,
          overflowMode: LegendItemOverflowMode.wrap),
      series: <SplineSeries<Map, String>>[
        SplineSeries<Map, String>(
            // Bind data source
            dataSource: egrsData,
            xValueMapper: (Map sales, _) => sales["Month"],
            yValueMapper: (Map sales, _) => sales["Value"],
            name: 'Average Process Time',
            markerSettings:
                const MarkerSettings(isVisible: true, color: Colors.blue),
            // Enable data label
            dataLabelSettings: const DataLabelSettings(
                isVisible: true, labelAlignment: ChartDataLabelAlignment.top)),
        SplineSeries<Map, String>(
          // Bind data source
          dataSource: egrsData,
          color: Colors.red,
          xValueMapper: (Map sales, _) => sales["Month"],
          yValueMapper: (Map sales, _) => sales["Target"],
          name: 'Targets',
          // Enable data label
        ),
      ],
    );
  }
}
