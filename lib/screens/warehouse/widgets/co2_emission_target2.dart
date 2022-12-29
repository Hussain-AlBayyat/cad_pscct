import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pscct/repositories/wh_logistics_repository.dart';
import 'package:pscct/shared-widgets/loading_circular.dart';

import '../../../shared-widgets/file_opener.dart';

class FileViewer extends StatelessWidget {
  FileViewer({required this.file_key, Key? key}) : super(key: key);
  final String file_key;

  final WarehouseLogisticsRepository warehouseLogisticsRepository =
      WarehouseLogisticsRepository();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<File?>(
        future: warehouseLogisticsRepository.getCo2Image(file_key),
        builder: (context, file) {
          if (file.hasError)
            return Center(
                child: Text(
              (file.error as DioError).message,
              style: TextStyle(fontSize: 18, color: Colors.red),
            ));
          if (!file.hasData) return LoadingCircular();
          return FileOpener(file: file.data!);
        });
    /*   Echarts(option: '''{

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
    top:'10%',
    containLabel: true
  },

  xAxis: {
    type: 'category',
        boundaryGap: true,
  axisLabel: {
        interval: 0,
        rotate: 45 
      },
    data: ${jsonEncode(co2EmissionTargetData.map((e) => e["Year"]).toList())}
  },

  yAxis: {
    type: 'value',
    axisLine: {
        show: true,

      },
    axisLabel: {
      formatter: '{value}',
    },
  },



  series: [
    {
      name: 'Within Two Weeks',
      type: 'line',
      itemStyle:{
      color:'green'
      },
      label: {
        show: true,
        position: 'bottom',
        color:'black'
      },

      data: ${jsonEncode(co2EmissionData.map((e) => e["Value"]).toList())}

    },
        {
      name: 'Overdue',
      type: 'line',
      itemStyle:{
      color:'orange'
      },
       lineStyle: {
        width: 2,
        dashOffset:10,
        type: 'dashed'
      },
      label: {
        show: true,
        position: 'top',
        color:'black'
      },

      data: ${jsonEncode(co2EmissionTargetData.map((e) => e["Value"]).toList())}

    },
  ]
}'''));*/
    /*SfCartesianChart(
      plotAreaBorderWidth: 0,
      //title: ChartTitle(text: "CO2 EMISSION TARGET"),
      primaryXAxis: CategoryAxis(
        title: AxisTitle(text: "Year"),
        labelIntersectAction: AxisLabelIntersectAction.wrap,
        majorTickLines: const MajorTickLines(width: 0),
        majorGridLines: const MajorGridLines(width: 0),
      ),
      primaryYAxis: NumericAxis(
        title: AxisTitle(text: "K Ton CO2 Per Annum"),
        majorTickLines: const MajorTickLines(width: 0),
        majorGridLines: const MajorGridLines(width: 0),
      ),
      legend: Legend(
          isVisible: true,
          overflowMode: LegendItemOverflowMode.wrap,
          position: LegendPosition.bottom),
      series: <LineSeries<Map, String>>[
        LineSeries<Map, String>(
            // Bind data source

            markerSettings:
                const MarkerSettings(isVisible: false, color: Colors.green),
            dataSource: co2EmissionData,
            xValueMapper: (Map sales, _) => sales["Year"],
            yValueMapper: (Map sales, _) => sales["Value"],
            dataLabelMapper: (Map data, _) => "HI",
            name: 'P&SCM Target',
            color: Colors.blue,

            // Enable data label
            dataLabelSettings: DataLabelSettings(
                isVisible: true,
                labelAlignment: ChartDataLabelAlignment.top,
                builder: (dynamic data, dynamic point, dynamic series,
                    int pointIndex, int seriesIndex) {
                  if (pointIndex == data.length) {
                    return Container(
                      height: 41,
                      width: 30,
                      transform: Matrix4.translationValues(0, 10, 0),
                      child: Column(
                        children: const [
                          Text(
                            "53%",
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.arrow_downward,
                            color: Colors.green,
                          ),
                        ],
                      ),
                    );
                  } else if (pointIndex == 1) {
                    return Container(
                      height: 41,
                      width: 50,
                      transform: Matrix4.translationValues(0, 10, 0),
                      child: Column(
                        children: const [
                          Text(
                            "17.8K",
                            style: TextStyle(color: Colors.purple),
                          ),
                          Icon(
                            Icons.arrow_downward_sharp,
                            color: Colors.purple,
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Container();
                  }
                })),
        LineSeries<Map, String>(
            // Bind data source
            dashArray: [10],
            dataSource: co2EmissionTargetData,
            xValueMapper: (Map sales, _) => sales["Year"],
            yValueMapper: (Map sales, _) => sales["Value"],
            name: 'SA Target',
            color: Colors.orange,

            // Enable data label
            dataLabelSettings: const DataLabelSettings()),
      ],
    );*/
  }
}
