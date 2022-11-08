import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class PendingGoodsReceipt extends StatelessWidget {
  PendingGoodsReceipt({Key? key}) : super(key: key);
  final pendingGoodsReceiptData = [
    {"Area": "Abqaiq", "Value1": 1982, "Value2": 304},
    {"Area": "Norther Area", "Value1": 3176, "Value2": 782},
    {"Area": "Dhahran", "Value1": 694, "Value2": 124},
    {"Area": "Souther/Central Region", "Value1": 1085, "Value2": 188},
    {"Area": "Western Region", "Value1": 955, "Value2": 637}
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
        numberFormat: NumberFormat.compact(),
        majorTickLines: const MajorTickLines(width: 0),
        majorGridLines: const MajorGridLines(width: 0),
      ),
      legend: Legend(
          isVisible: true,
          overflowMode: LegendItemOverflowMode.wrap,
          position: LegendPosition.top),
      series: <ColumnSeries<Map, String>>[
        ColumnSeries<Map, String>(
            // Bind data source
            dataSource: pendingGoodsReceiptData,
            xValueMapper: (Map sales, _) => sales["Area"],
            yValueMapper: (Map sales, _) => sales["Value1"],
            color: Colors.green,
            name: "Within Two Weeks",
            dataLabelSettings: const DataLabelSettings(
              isVisible: true,
            )),
        ColumnSeries<Map, String>(
            // Bind data source
            dataSource: pendingGoodsReceiptData,
            xValueMapper: (Map sales, _) => sales["Area"],
            yValueMapper: (Map sales, _) => sales["Value2"],
            color: Colors.blue,
            name: "Overdue",

            // Enable data label
            dataLabelSettings: const DataLabelSettings(
              isVisible: true,
            )),
      ],
    );
  }
}
