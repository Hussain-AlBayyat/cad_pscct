import 'package:freezed_annotation/freezed_annotation.dart';
part 'cartesian_chart.freezed.dart';
part 'cartesian_chart.g.dart';

@Freezed()
class CartesianChart with _$CartesianChart {
  const CartesianChart._(); // Added constructor
  const factory CartesianChart.line(Map data) = _CartesianLineChart;
  const factory CartesianChart.bar() = _CartesianBarChart;

  factory CartesianChart.fromJson(Map<String, dynamic> json) =>
      _$CartesianChartFromJson(json);
}
