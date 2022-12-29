import 'package:flutter/material.dart';

class SyncfusionPieChart extends StatelessWidget {
  const SyncfusionPieChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
    /*  return SfCircularChart(
      // Initialize category axis
      series: <PieSeries<Map, String>>[
        PieSeries<Map, String>(
            // Bind data source

            dataSource: salesData,
            xValueMapper: (Map sales, _) => sales["Month"],
            yValueMapper: (Map sales, _) => sales["Value"],
            name: 'Sales',
            // Enable data label
            dataLabelSettings: DataLabelSettings(isVisible: true)),
      ],
    );*/
  }
}
