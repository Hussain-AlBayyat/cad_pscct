import 'package:flutter/material.dart';

import '../../../models/enums/echart_configurator.dart';
import '../../../shared-widgets/echarts/echart.dart';

class PendingGoodsReceipt extends StatelessWidget {
  PendingGoodsReceipt({required this.data, Key? key}) : super(key: key);
  final List<Map> data;

  @override
  Widget build(BuildContext context) {
    return EChartCharts(
      data: data,
      name: "Pending GR",
      configurations: [
        EChartConfigurator(chartType: ChartType.bar),
        EChartConfigurator(chartType: ChartType.bar),
        EChartConfigurator(chartType: ChartType.bar),
        EChartConfigurator(chartType: ChartType.bar),
      ],
    );
  }
}
