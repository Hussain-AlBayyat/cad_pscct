import 'package:flutter/material.dart';

import '../../../models/enums/echart_configurator.dart';
import '../../../shared-widgets/echarts/echart.dart';

class UpcomingPurchaseOrder extends StatelessWidget {
  UpcomingPurchaseOrder({required this.data, Key? key}) : super(key: key);
  final List<Map> data;

  final pendingGoodsReceiptData = [
    {
      "Month": "May 2022",
      "Within Two Weeks": 19832232,
    },
    {
      "Month": "Jun 2022",
      "Within Two Weeks": 12312421,
    },
    {
      "Month": "Jul 2022",
      "Within Two Weeks": 23212331,
    },
    {
      "Month": "Aug 2022",
      "Within Two Weeks": 24123123,
    },
    {
      "Month": "Sep 2022",
      "Within Two Weeks": 14123123,
    },
    {
      "Month": "Oct 2022",
      "Within Two Weeks": 16242343,
    },
    {
      "Month": "Nov 2022",
      "Within Two Weeks": 12385924,
    }
  ];
  @override
  Widget build(BuildContext context) {
    return EChartCharts(
      data: data,
      name: "Lost Opportunity",
      configurations: [
        EChartConfigurator(chartType: ChartType.bar),
      ],
    );
/*
    SizedBox(
        height: getProportionateScreenHeight(300), child: Echarts(option: '''{

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
        rotate: 45,
        
      },
    data: ${jsonEncode(pendingGoodsReceiptData.map((e) => e["Month"]).toList())}
  },

  yAxis: {
    type: 'value',
    axisLine: {
        show: true,

      },
    axisLabel: {
      formatter: function (value, index) {
    return value / '1000000' + 'M';
}
    },
  },


  legend: {
    data: ${jsonEncode(pendingGoodsReceiptData.first.keys.toList())}
  },


  series: [
    {
      name: 'Within Two Weeks',
      type: 'bar',
      itemStyle:{
      color:'green'
      },
      label: {
        show: true,
        position: 'top',
        color:'black',
        formatter: function(d) {
          return (d.data / '1000000').toFixed(0) + 'M';

    }
      },

      data: ${jsonEncode(pendingGoodsReceiptData.map((e) => e["Within Two Weeks"]).toList())}

    },
    
  ]
}'''));
*/
    /*SfCartesianChart(
      plotAreaBorderWidth: 0,
      primaryXAxis: CategoryAxis(
        labelIntersectAction: AxisLabelIntersectAction.wrap,
        majorTickLines: const MajorTickLines(width: 0),
        majorGridLines: const MajorGridLines(width: 0),
      ),
      primaryYAxis: NumericAxis(
        numberFormat: NumberFormat.compact(),
        majorTickLines: const MajorTickLines(width: 0),
        majorGridLines: const MajorGridLines(width: 0),
      ),
      series: <ColumnSeries<Map, String>>[
        ColumnSeries<Map, String>(
            // Bind data source
            dataSource: pendingGoodsReceiptData,
            xValueMapper: (Map sales, _) => sales["Month"],
            yValueMapper: (Map sales, _) => sales["Value"],
            color: Colors.blue,
            name: "Within Two Weeks",
            dataLabelSettings: const DataLabelSettings(
              isVisible: true,
            )),
      ],
    );*/
  }
}
