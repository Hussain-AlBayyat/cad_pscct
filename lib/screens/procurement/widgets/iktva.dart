import 'package:flutter/material.dart';
import 'package:pscct/models/enums/echart_configurator.dart';

import '../../../shared-widgets/echarts/echart.dart';

class IKTVA extends StatelessWidget {
  IKTVA({required this.data, Key? key}) : super(key: key);
  final List<Map> data;
  final List<Map> filteredData = [];
  @override
  Widget build(BuildContext context) {
    data.forEach((element) {
      Map x = {};

      element.forEach((key, value) {
        if (value == "0.000" || value == "0") {
          x[key] = null;
        } else
          x[key] = value;
      });
      filteredData.add(x);
    });
    return EChartCharts(
      data: filteredData,
      name: "IKTVA",
      configurations: [
        EChartConfigurator(chartType: ChartType.line, symbolType: "none"),
        EChartConfigurator(lineType: LineType.dashed, symbolType: "none"),
      ],
    );
  }
}
