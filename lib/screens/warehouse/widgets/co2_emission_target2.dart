import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CO2EmissionTargets extends StatelessWidget {
  CO2EmissionTargets({Key? key}) : super(key: key);
  final co2EmissionData = [
    {"Year": "2020", "Value": 20},
    {"Year": "2025", "Value": 15},
    {"Year": "2030", "Value": 10},
  ];
  final co2EmissionTargetData = [
    {"Year": "2020", "Value": 20},
    {"Year": "2025", "Value": 16},
    {"Year": "2030", "Value": 12},
    {"Year": "2035", "Value": 8},
    {"Year": "2040", "Value": 4},
    {"Year": "2045", "Value": 0}
  ];
  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
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
    );
  }
}
