import 'package:flutter/material.dart';

import '../../../models/enums/echart_configurator.dart';
import '../../../shared-widgets/echarts/echart.dart';

class InventoryTrend extends StatelessWidget {
  const InventoryTrend({required this.data, Key? key}) : super(key: key);
  final List<Map> data;

  @override
  Widget build(BuildContext context) {
    return EChartCharts(
      data: data,
      name: "Inventory Trend",
      isSecondMode: true,
      configurations: [
        EChartConfigurator(),
        EChartConfigurator(),
        EChartConfigurator(),
        EChartConfigurator(),
      ],
    );
  }
}
