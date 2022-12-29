import 'package:flutter/material.dart';

import '../../../models/enums/echart_configurator.dart';
import '../../../shared-widgets/echarts/echart.dart';

class ShippingPriceIndex extends StatelessWidget {
  ShippingPriceIndex({required this.data, Key? key}) : super(key: key);
  final List<Map> data;

  @override
  Widget build(BuildContext context) {
    return EChartCharts(
      data: data,
      name: "Shipping Price Index",
      configurations: [
        EChartConfigurator(),
      ],
    );

    /* SfCartesianChart(
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
  }*/
  }
}
