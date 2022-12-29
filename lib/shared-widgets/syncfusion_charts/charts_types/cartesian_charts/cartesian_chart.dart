import 'package:flutter/material.dart';

import '../../../../models/cartesian_chart.dart';

class SyncfusionCartesianChart extends StatelessWidget {
  SyncfusionCartesianChart({required this.chartsTypes, Key? key})
      : super(key: key);
  final List<CartesianChart> chartsTypes;

  SyncfusionCartesianChart.line(this.chartsTypes);
  @override
  Widget build(BuildContext context) {
    return Container();
    /*   return SfCartesianChart(
      primaryXAxis: CategoryAxis(
        labelRotation: -22,
        majorGridLines: const MajorGridLines(width: 0),
      ),
      primaryYAxis: NumericAxis(
          labelFormat: '\${value}M',
          majorGridLines: const MajorGridLines(width: 0),
          majorTickLines: const MajorTickLines(size: 0)),
      series: [
        for (CartesianChart chart in chartsTypes)
          chart.when(
            line: (data) => constructLine(data),
            bar: () => constructBar(null),
          ),
      ],
    );*/
  }
  //
  // LineSeries<Map, String> constructLine(Map data) {
  //   //var dataList = data["data"] as List<Map>;
  //
  //   return LineSeries<Map, String>(
  //       dataSource: data["data"],
  //       xValueMapper: (Map data, _) => data.values.first, //["Month"],
  //       yValueMapper: (Map data, _) => double.parse(data["VALUE001"]),
  //       name: 'Sales',
  //       dataLabelSettings: const DataLabelSettings(isVisible: true));
  // }
  //
  // BarSeries<Map, String> constructBar(List<Map> data) {
  //   return BarSeries<Map, String>(
  //       // Bind data source
  //       dataSource: data,
  //       xValueMapper: (Map sales, _) => sales["Month"],
  //       yValueMapper: (Map sales, _) => sales["Value"],
  //       name: 'Sales',
  //
  //       // Enable data label
  //       dataLabelSettings: const DataLabelSettings(isVisible: true));
  // }
}
