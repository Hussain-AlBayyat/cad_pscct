import 'package:flutter/material.dart';
import 'package:pscct/size_config.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../shared-widgets/bar_percentage.dart';

class InventoryTrend extends StatelessWidget {
  const InventoryTrend({Key? key}) : super(key: key);
  static const List<Map> spendData = [
    {
      "title": "Drilling",
      "amount": 10,
      "percentage": 90,
    },
    {
      "title": "Projects",
      "amount": 10,
      "percentage": 90,
    },
    {
      "title": "MRO",
      "amount": 10,
      "percentage": 90,
    },
  ];
  static const trendData1 = [
    {
      "Month": "Nov 21",
      "Value": 49,
    },
    {
      "Month": "Dec 21",
      "Value": 39,
    },
    {
      "Month": "Jan 22",
      "Value": 45,
    },
    {
      "Month": "Feb 22",
      "Value": 42,
    },
    {
      "Month": "Mar 22",
      "Value": 41,
    },
    {
      "Month": "Apr 22",
      "Value": 44,
    },
  ];
  static const trendData2 = [
    {
      "Month": "Nov 21",
      "Value": 33,
    },
    {
      "Month": "Dec 21",
      "Value": 26,
    },
    {
      "Month": "Jan 22",
      "Value": 35,
    },
    {
      "Month": "Feb 22",
      "Value": 32,
    },
    {
      "Month": "Mar 22",
      "Value": 31,
    },
    {
      "Month": "Apr 22",
      "Value": 31,
    },
  ];
  static const trendData3 = [
    {
      "Month": "Nov 21",
      "Value": 23,
    },
    {
      "Month": "Dec 21",
      "Value": 16,
    },
    {
      "Month": "Jan 22",
      "Value": 25,
    },
    {
      "Month": "Feb 22",
      "Value": 12,
    },
    {
      "Month": "Mar 22",
      "Value": 21,
    },
    {
      "Month": "Apr 22",
      "Value": 11,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(
          spendData.length,
          (index) => SpendItem(
            title: spendData[index]["title"],
            amount: spendData[index]["amount"],
            percentage: spendData[index]["percentage"],
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(60),
        ),
        SfCartesianChart(
          plotAreaBorderWidth: 0,
          backgroundColor: Colors.transparent,
          primaryXAxis: CategoryAxis(
            majorTickLines: const MajorTickLines(width: 0),
            majorGridLines: const MajorGridLines(width: 0),
          ),
          legend: Legend(
              isVisible: true,
              overflowMode: LegendItemOverflowMode.wrap,
              position: LegendPosition.bottom),
          primaryYAxis: NumericAxis(
            labelFormat: '{value}\%',
            maximumLabels: 2,
            majorTickLines: const MajorTickLines(width: 0),
            majorGridLines: const MajorGridLines(width: 0),
          ),
          series: [
            LineSeries<Map, String>(
              name: "Drilling",
              // Bind data source
              dataSource: trendData1,
              xValueMapper: (Map sales, _) => sales["Month"],
              yValueMapper: (Map sales, _) => sales["Value"],
              color: Colors.orange,

              // Enable data label
            ),
            LineSeries<Map, String>(
              // Bind data source
              dataSource: trendData2,
              name: "MRO",

              xValueMapper: (Map sales, _) => sales["Month"],
              yValueMapper: (Map sales, _) => sales["Value"],
              color: Colors.blue,

              // Enable data label
            ),
            LineSeries<Map, String>(
              // Bind data source
              dataSource: trendData3,
              name: "Drilling",

              xValueMapper: (Map sales, _) => sales["Month"],
              yValueMapper: (Map sales, _) => sales["Value"],
              color: Colors.grey,

              // Enable data label
            ),
          ],
        ),
      ],
    );
  }
}
