import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class UpcomingPurchaseOrder extends StatelessWidget {
  UpcomingPurchaseOrder({Key? key}) : super(key: key);

  final pendingGoodsReceiptData = [
    {
      "Month": "May 2022",
      "Value": 19832232,
    },
    {
      "Month": "Jun 2022",
      "Value": 12312421,
    },
    {
      "Month": "Jul 2022",
      "Value": 23212331,
    },
    {
      "Month": "Aug 2022",
      "Value": 24123123,
    },
    {
      "Month": "Sep 2022",
      "Value": 14123123,
    },
    {
      "Month": "Oct 2022",
      "Value": 16242343,
    },
    {
      "Month": "Nov 2022",
      "Value": 12385924,
    }
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
      series: <ColumnSeries<Map, String>>[
        ColumnSeries<Map, String>(
            // Bind data source
            dataSource: pendingGoodsReceiptData,
            xValueMapper: (Map sales, _) => sales["Month"],
            yValueMapper: (Map sales, _) => sales["Value"],
            color: Colors.blue,
            name: "Within Two Weeks",
            dataLabelSettings: const DataLabelSettings(
              isVisible: true,
            )),
      ],
    );
  }
}
