import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ShippingPriceIndex extends StatelessWidget {
  ShippingPriceIndex({Key? key}) : super(key: key);
  final shippingPriceIndexData = [
    {"Quarter": "Q1 2019", "Value": 1.3},
    {"Quarter": "Q2 2019", "Value": 1.3},
    {"Quarter": "Q3 2019", "Value": 1.3},
    {"Quarter": "Q4 2019", "Value": 1.4},
    {"Quarter": "Q1 2020", "Value": 1.4},
    {"Quarter": "Q2 2020", "Value": 1.8},
    {"Quarter": "Q3 2020", "Value": 2.2},
    {"Quarter": "Q4 2020", "Value": 3.1},
    {"Quarter": "Q1 2021", "Value": 4.4},
    {"Quarter": "Q2 2021", "Value": 6.8},
    {"Quarter": "Q3 2021", "Value": 10.8},
    {"Quarter": "Q4 2021", "Value": 9.3},
    {"Quarter": "Q1 2022", "Value": 9.4},
    {"Quarter": "Q2 2022", "Value": 7.0},
    {"Quarter": "Q3 2022", "Value": 6.4},
  ];
  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      //title: ChartTitle(text: "SHIPPING PRICE INDEX (\$M)"),
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
            dataSource: shippingPriceIndexData,
            xValueMapper: (Map sales, _) => sales["Quarter"],
            yValueMapper: (Map sales, _) => sales["Value"],
            name: 'Average Process Time',
            color: Colors.green,
            markerSettings:
                const MarkerSettings(isVisible: true, color: Colors.green),
            // Enable data label
            dataLabelSettings: const DataLabelSettings(
                isVisible: true, labelAlignment: ChartDataLabelAlignment.top)),
      ],
    );
  }
}
