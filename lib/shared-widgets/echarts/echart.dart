import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_echarts/flutter_echarts.dart';
import 'package:intl/intl.dart';
import 'package:pscct/helper.dart';
import 'package:pscct/models/enums/echart_configurator.dart';
import 'package:pscct/size_config.dart';

class EChartCharts extends StatelessWidget {
  EChartCharts(
      {required this.data,
      this.isSecondMode = false,
      required this.name,
      this.showAxis = true,
      this.configurations,
      Key? key})
      : super(key: key);
  final List<Map> data;
  final String name;
  final bool showAxis;
  final bool isSecondMode;
  final List<EChartConfigurator>? configurations;
  List<Map> seriesList = [];
  List legendsData = [];

  @override
  Widget build(BuildContext context) {
    // var xAxis = data!.map((e) => e.values.first).toSet().toList();
    var xAxis = data
        .map((e) {
          if (e.keys.contains("Calendar day")) {
            DateTime date = DateTime.parse(e.values.first);
            String tempDate = new DateFormat("yyyy/MM/dd").format(date);
            return tempDate;
          } else
            return e.values.first;
        })
        .toSet()
        .toList();

    if (isSecondMode) {
      legendsData =
          data!.map((e) => e.values.toList().sublist(1).first).toList();
    } else {
      legendsData = data!.map((e) => e.keys.toList().sublist(1)).first.toList();
    }

    return Visibility(
      visible: data.first["ERROR"] == null,
      replacement: Text("ERROR: ${data.first["ERROR"]}",
          style: TextStyle(color: Colors.red, fontSize: 18)),
      child: SizedBox(
        height: getProportionateScreenHeight(300),
        child: Echarts(
          option: '''{
  color: ['#00A3E0','#84BD00','#00843D','#0033A0','#26A8AB','#643278','#FFC846','#F05F41'],
  tooltip: {
      trigger: 'axis',
      axisPointer: {
        type: 'cross'
      }
  },
  legend: {
  show:${jsonEncode(legendsData.length > 1 ? true : false)},
  textStyle:{
    color:'grey',

  },
    data: ${jsonEncode(legendsData)}
  },
    grid: {
    left: '4%',
    right: '0%',
    bottom: '0%',
    
    containLabel: true
  },
  xAxis: {
    show:${jsonEncode(showAxis)},
     type: 'category',
      // prettier-ignore
    axisLabel: {
          interval: ${xAxis.length > 15 ? 4 : 0},
        rotate: 45 
        },
      data: ${jsonEncode(xAxis)}
  
  },
  yAxis: {
    show:${jsonEncode(showAxis)},

      type: 'value',
      axisLine: {
        "show": true,
      },
      axisLabel: {
      formatter: function(value,index) {
        let formatter = Intl.NumberFormat('en',{notation:'compact'});
        return formatter.format(value);
      }

      }
    },

  series: ${jsonEncode(isSecondMode ? test3() : test())}
}
                      ''',
          extraScript: '''
                        chart.on('click', (params) => {
                          if(params.componentType === 'series') {
                            Messager.postMessage(JSON.stringify({
                              type: 'select',
                              payload: params.dataIndex,
                            }));
                          }
                        });
                      ''',
        ),
      ),
    );
  }

  setupYaxis() {
    Map yAxis = {
      "type": 'value',
      "axisLine": {
        "show": true,
      },
      "axisLabel": (String value) {
        return value;
      }
    };
    return yAxis;
  }

  test3() {
    Map<String, List> seriesDataList = {};
    //print(data!.map((e) => e.values.first).toSet().toList());
    data!.toList().sublist(0, data!.length)?.forEach((element) {
      List listWithNoTitle = element.values.toList().sublist(1);

      for (int i = 0; i < listWithNoTitle.length - 1; i++) {
        if (seriesDataList[listWithNoTitle[i]] == null) {
          seriesDataList[listWithNoTitle[i]] = [];
        }
        seriesDataList[listWithNoTitle[i]]?.add(listWithNoTitle[i + 1]);
      }
    });
    legendsData = seriesDataList.keys.toList();
    for (int index = 0; index < seriesDataList.length; index++) {
      Map series = {
        "name": '${seriesDataList.keys.toList()[index]}',
        "type": configurations![index].chartType.name,
        "lineStyle": {
          //"color": 'green',
          "width": 2,
          "dashOffset": 10,
          "type": configurations?[index]?.lineType.name
        },
        "areaStyle": {
          "opacity": configurations?[index].areaStyleOpacity,
          "color": 'blue'
        },
        "label": {
          "show": false,
          "position": 'top',
          "textStyle": {"fontSize": 14},
          "formatter":
              Helper.compactNumber(seriesDataList.values.toList()[index].first)
        },
        "data": formatData(seriesDataList.values.toList()[index]),
      };
      seriesList.add(series);
    }

    return seriesList;
  }

  formatData(List data) {
    var da = data
        .map((e) => e != null ? double.parse(e).toStringAsFixed(0) : null)
        .toList();

    return data;
  }

  test() {
    List<List> seriesDataList = [];

    data!.toList().sublist(0, data!.length)?.forEach((element) {
      List listWithNoTitle = element.values.toList().sublist(1);

      for (int i = 0; i < listWithNoTitle.length; i++) {
        if (seriesDataList.length != listWithNoTitle.length)
          seriesDataList.add([]);
        seriesDataList[i].add(listWithNoTitle[i]);
      }
    });
    seriesDataList.asMap().forEach((
      index,
      dataSet,
    ) {
      Map series = {
        "name": legendsData[index],
        "type": configurations![index].chartType.name,
        "smooth": true,
        "symbol": configurations?[index].symbolType,
        "stack": configurations?[index].stackType,
        "connectNulls": true,
        "sampling": {"type": "min", "threshold": "4"},
        "lineStyle": {
          "color": configurations?[index].lineColor,
          "width": configurations?[index].lineWidth,
          "dashOffset": 10,
          "type": configurations?[index].lineType.name
        },
        "areaStyle": {
          "opacity": configurations?[index].areaStyleOpacity,
          "color": configurations?[index].areaColor
        },
        "label": {
          "show": configurations?[index].showLabel,
          "position": configurations?[index].labelPosition,
          "textStyle": {
            "fontSize": 14,
            "color": configurations?[index].labelColor
          },
          // "formatter":
          //     dataSet[index] != null ? dataSet.map((e) => Helper.compactNumber(e)).toList() : ""
        },
        "data": formatData(dataSet),
      };

      seriesList.add(series);
    });

    return seriesList;
  }
}
//  dataZoom: [{type:'inside',start:0,end:3},{start:5,end:10}],
