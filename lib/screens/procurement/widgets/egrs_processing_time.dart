import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_echarts/flutter_echarts.dart';

import '../../../models/enums/echart_configurator.dart';
import '../../../shared-widgets/echarts/echart.dart';
import '../../../size_config.dart';

class EGRSProcessingTime extends StatelessWidget {
  EGRSProcessingTime({required this.data, Key? key}) : super(key: key);
  final List<Map> data;

  final egrsData = [
    {"Month": "Sep 2021", "Value": 17.6, "Target": 10},
    {"Month": "Oct 2021", "Value": 21.4, "Target": 10},
    {"Month": "Nov 2021", "Value": 24.7, "Target": 10},
    {"Month": "Dec 2021", "Value": 17.4, "Target": 10},
    {"Month": "Jan 2022", "Value": 12.6, "Target": 10},
    {"Month": "Feb 2022", "Value": 15.9, "Target": 10},
    {"Month": "Mar 2021", "Value": 22.9, "Target": 10},
    {"Month": "APR 2022", "Value": 13.1, "Target": 10},
    {"Month": "May 2022", "Value": 15.0, "Target": 10},
    {"Month": "Jun 2021", "Value": 15.7, "Target": 10},
    {"Month": "Jul 2022", "Value": 15.1, "Target": 10},
    {"Month": "Aug 2022", "Value": 18.9, "Target": 10},
  ];
  @override
  Widget build(BuildContext context) {
    return EChartCharts(
      data: data,
      name: "Lost Opportunity",
      configurations: [
        EChartConfigurator(
          chartType: ChartType.line,
          showLabel: true,
          //labelColor: Theme.of(context).highlightColor.toString(),
        ),
        EChartConfigurator(chartType: ChartType.line)
      ],
    );

    SizedBox(
        height: getProportionateScreenHeight(300), child: Echarts(option: '''{

  tooltip: {
    trigger: 'axis',
    axisPointer: {
      type: 'cross'
    }
  },

   grid: {
    left: '5%',
    right: '1%',
    bottom: '3%',
    containLabel: true
  },
  xAxis: {
    type: 'category',
        boundaryGap: false,
  axisLabel: {
        interval: 0,
        rotate: 45 
      },
    data: ${jsonEncode(egrsData.map((e) => e["Month"]).toList())}
  },

  yAxis: {
    type: 'value',
    axisLine: {
        show: true,

      },
    splitNumber:3,
    axisLabel: {
      formatter: '{value}',
    },
  },


  legend: {
  formatter: function (name) {
    return 'Average Process Time';
},
    data: ${jsonEncode(egrsData.first.keys.toList())}
  },


  series: [
    {
      name: 'Value',
      type: 'line',
      stack: 'Total',
      smooth: true,
    
      label: {
        show: true,
        position: 'top',
        color:'black'
      },

      data: ${jsonEncode(egrsData.map((e) => e["Value"]).toList())}

    },



      {
      name: 'Targets',
      type: 'line',
      smooth: true,
      showSymbol:false,
      itemStyle: {
          color: 'red',
        },

      data: ${jsonEncode(egrsData.map((e) => e["Target"]).toList())},
       label: {
        show: false,
        position: 'top',
        textStyle: {
          fontSize: 12
        }
      }
    },
  ]
}'''));
    /*SfCartesianChart(
      plotAreaBorderWidth: 0,
      primaryXAxis: CategoryAxis(
        labelIntersectAction: AxisLabelIntersectAction.wrap,
        majorTickLines: const MajorTickLines(width: 0),
        majorGridLines: const MajorGridLines(width: 0),
      ),
      primaryYAxis: NumericAxis(
        majorTickLines: const MajorTickLines(width: 0),
        majorGridLines: const MajorGridLines(width: 0),
        labelIntersectAction: AxisLabelIntersectAction.wrap,
        interval: 5,
      ),
      legend: Legend(
          position: LegendPosition.top,
          isVisible: true,
          overflowMode: LegendItemOverflowMode.wrap),
      series: <SplineSeries<Map, String>>[
        SplineSeries<Map, String>(
            // Bind data source
            dataSource: egrsData,
            xValueMapper: (Map sales, _) => sales["Month"],
            yValueMapper: (Map sales, _) => sales["Value"],
            name: 'Average Process Time',
            markerSettings:
                const MarkerSettings(isVisible: true, color: Colors.blue),
            // Enable data label
            dataLabelSettings: const DataLabelSettings(
                isVisible: true, labelAlignment: ChartDataLabelAlignment.top)),
        SplineSeries<Map, String>(
          // Bind data source
          dataSource: egrsData,
          color: Colors.red,
          xValueMapper: (Map sales, _) => sales["Month"],
          yValueMapper: (Map sales, _) => sales["Target"],
          name: 'Targets',
          // Enable data label
        ),
      ],
    );*/
  }
}
