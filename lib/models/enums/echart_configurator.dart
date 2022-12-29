class EChartConfigurator {
  EChartConfigurator(
      {this.lineType = LineType.normal,
      this.chartType = ChartType.line,
      this.showLabel = false,
      this.labelPosition = "top",
      this.symbolType,
      this.areaColor,
      this.stackType,
      this.lineColor,
      this.labelColor,
      this.lineWidth = 2,
      this.areaStyleOpacity = 0.0});
  final LineType lineType;
  final ChartType chartType;
  final String? areaColor,
      labelColor,
      lineColor,
      labelPosition,
      stackType,
      symbolType;
  final int lineWidth;
  final bool showLabel;
  final double areaStyleOpacity;

  setup() {}
}

enum LineType { dashed, normal }

enum ChartType { line, bar, pie }
