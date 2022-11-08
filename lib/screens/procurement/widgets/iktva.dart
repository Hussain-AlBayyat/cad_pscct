import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class IKTVA extends StatelessWidget {
  IKTVA({Key? key}) : super(key: key);
  final iktvaData1 = [
    {
      "Month": "2022 Q1",
      "Value": 60,
    },
    {
      "Month": "2022 Q2",
      "Value": 61,
    },
  ];
  final iktvaData2 = [
    {
      "Month": "2022 Q2",
      "Value": 61,
    },
    {
      "Month": "2022 Q3",
      "Value": 63,
    },
    {
      "Month": "2022 Q4",
      "Value": 63,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      backgroundColor: Colors.transparent,
      primaryXAxis: CategoryAxis(
        majorTickLines: const MajorTickLines(width: 0),
        majorGridLines: const MajorGridLines(width: 0),
      ),
      primaryYAxis: NumericAxis(
          labelFormat: '{value}\%',
          maximumLabels: 2,
          majorTickLines: const MajorTickLines(width: 0),
          majorGridLines: const MajorGridLines(width: 0),
          minimum: 60,
          maximum: 63),
      series: [
        LineSeries<Map, String>(
          // Bind data source
          dataSource: iktvaData1,
          xValueMapper: (Map sales, _) => sales["Month"],
          yValueMapper: (Map sales, _) => sales["Value"],
          color: Colors.green,

          // Enable data label
        ),
        LineSeries<Map, String>(
            // Bind data source
            dataSource: iktvaData2,
            dashArray: <double>[
              4,
            ],
            xValueMapper: (Map sales, _) => sales["Month"],
            yValueMapper: (Map sales, _) => sales["Value"],
            color: Colors.green,
            // Enable data label
            dataLabelSettings: const DataLabelSettings(
                isVisible: true,
                textStyle: TextStyle(color: Colors.white),
                labelAlignment: ChartDataLabelAlignment.top)),
      ],
    );
  }
}
