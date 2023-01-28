import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_echarts/flutter_echarts.dart';

import '../../../models/enums/echart_configurator.dart';
import '../../../shared-widgets/echarts/echart.dart';
import '../../../size_config.dart';

class SESProcessingTime extends StatelessWidget {
  SESProcessingTime({required this.data, Key? key}) : super(key: key);
  final List<Map> data;

  final sesData = [
    {"Month": "Oct 2021", "Value": 65.5, "Approval Time": 14.6, "Target": 67},
    {"Month": "Nov 2021", "Value": 66, "Approval Time": 14.4, "Target": 69},
    {"Month": "Dec 2021", "Value": 59.7, "Approval Time": 12.6, "Target": 62},
    {"Month": "Jan 2022", "Value": 58.1, "Approval Time": 13, "Target": 63},
    {"Month": "Feb 2022", "Value": 55.1, "Approval Time": 13.1, "Target": 60},
    {"Month": "Mar 2022", "Value": 55.4, "Approval Time": 13, "Target": 62},
    {"Month": "APR 2022", "Value": 57.8, "Approval Time": 14.5, "Target": 67},
    {"Month": "May 2022", "Value": 66.8, "Approval Time": 19.6, "Target": 70},
    {"Month": "Jun 2022", "Value": 70.9, "Approval Time": 13.9, "Target": 73},
    {"Month": "Jul 2022", "Value": 68.6, "Approval Time": 21.2, "Target": 75},
    {"Month": "Aug 2022", "Value": 64.1, "Approval Time": 13.4, "Target": 70},
    {"Month": "Sep 2022", "Value": 60.1, "Approval Time": 13, "Target": 65},
  ];
  @override
  Widget build(BuildContext context) {
    return EChartCharts(
      data: data,
      name: "SES Processing Time",
      configurations: [
        EChartConfigurator(
            areaStyleOpacity: 0.9,
            stackType: "total",
            labelColor: "white",
            lineWidth: 0,
            showLabel: true,
            labelPosition: "bottom"),
        EChartConfigurator(
          lineColor: "red",
          symbolType: "none",
          showLabel: false,
          areaStyleOpacity: 0.0,
        ),
        EChartConfigurator(
            areaStyleOpacity: 0.7,
            showLabel: true,
            labelColor: Theme.of(context).brightness == Brightness.dark
                ? "white"
                : "black",
            stackType: "total",
            lineWidth: 0)
      ],
    );

    SizedBox(
      height: getProportionateScreenHeight(300),
      child: Echarts(
        option: '''{

  tooltip: {
    trigger: 'axis',
    axisPointer: {
      type: 'cross'
    }
  },
  
   grid: {
    left: '1%',
    right: '1%',
    bottom: '3%',
    containLabel: true
  },
  xAxis: {
    type: 'category',
        boundaryGap: false,
splitNumber:1,
nameGap:0,
    data: ${jsonEncode(sesData.map((e) => e["Month"]).toList())}
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
    data: ${jsonEncode(sesData.first.keys.toList())}
  },
  
  
  series: [
    {
      name: 'Value',
      type: 'line',
      stack: 'Total',
      smooth: true,
      lineStyle: {
        width: 0
      },
      label: {
        show: true,
        position: 'bottom',
        color:'white'
      },
      areaStyle: {
        opacity: 0.8,
        color: 'blue'
      },
      data: ${jsonEncode(sesData.map((e) => e["Value"]).toList())}
   
    },
    {
      name: 'Approval Time',
      type: 'line',
      stack: 'Total',
      smooth: true,
      
      lineStyle: {
        width: 0
      },
          label: {
        show: true,
        position: 'bottom',
      },
      areaStyle: {
        opacity: 0.8,
        color: 'green'
      },
      data: ${jsonEncode(sesData.map((e) => e["Approval Time"]).toList())},
     label: {
        show: true,
        position: 'top',
        textStyle: {
          fontSize: 12
        }
      }
    },
    
    
      {
      name: 'Target',
      type: 'line',
      smooth: true,
      
      lineStyle: {
        width: 1,color:'red'
      },
    
  
      data: ${jsonEncode(sesData.map((e) => e["Target"]).toList())},
     label: {
        show: false,
        position: 'top',
        textStyle: {
          fontSize: 12
        }
      }
    },
  ]
}''',
      ),
    );

    /* SfCartesianChart(
      plotAreaBorderWidth: 0,
      zoomPanBehavior: ZoomPanBehavior(
          enablePanning: true,
          enableDoubleTapZooming: true,
          enablePinching: true,
          enableMouseWheelZooming: true,
          zoomMode: ZoomMode.xy),
      backgroundColor: Colors.transparent,
      primaryXAxis: CategoryAxis(
        //labelRotation: 45,
        labelIntersectAction: AxisLabelIntersectAction.wrap,
        majorTickLines: const MajorTickLines(width: 0),
        majorGridLines: const MajorGridLines(width: 0),
      ),
      primaryYAxis: NumericAxis(
        maximum: 100,
        majorTickLines: const MajorTickLines(width: 0),
        majorGridLines: const MajorGridLines(width: 0),
      ),
      legend: Legend(
          isVisible: true,
          overflowMode: LegendItemOverflowMode.wrap,
          position: LegendPosition.top),
      series: [
        StackedAreaSeries<Map, String>(
            // Bind data source
            dataSource: sesData,
            xValueMapper: (Map sales, _) => sales["Month"],
            yValueMapper: (Map sales, _) => sales["Value"],
            name: 'Submission Time',
            color: Colors.blue,

            // Enable data label
            dataLabelSettings: const DataLabelSettings(
                isVisible: true,
                //textStyle: TextStyle(color: Colors.b),
                labelAlignment: ChartDataLabelAlignment.bottom)),
        StackedAreaSeries<Map, String>(
            // Bind data source
            dataSource: sesData,
            xValueMapper: (Map sales, _) => sales["Month"],
            yValueMapper: (Map sales, _) => sales["Approval Time"],
            name: 'Approval Time',
            color: Colors.green,
            dataLabelSettings: const DataLabelSettings(
                isVisible: true,
                //textStyle: TextStyle(color: Colors.bl),
                labelAlignment: ChartDataLabelAlignment.top)
            // Enable data label
            ),
        SplineSeries<Map, String>(
          // Bind data source
          dataSource: sesData,
          xValueMapper: (Map sales, _) => sales["Month"],
          yValueMapper: (Map sales, _) => sales["Target"],
          color: Colors.red,
          name: 'Target',

          // Enable data label
        ),
      ],
    );*/
  }
}
