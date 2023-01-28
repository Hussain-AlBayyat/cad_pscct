import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pscct/helper.dart';

part 'pscct_report.freezed.dart';
part 'pscct_report.g.dart';

@Freezed()
class PSCCTReport with _$PSCCTReport {
  const PSCCTReport._(); // Added constructor

  const factory PSCCTReport({
    required String Title,
    required String Description,
    required String CategoryText,
    @JsonKey(fromJson: PSCCTReport.xmlToJson)
        required List<Map<String, dynamic>> RawData,
    required String OrderOnApp,
    required String ComponentKey,
    required String ImageKey,
    required bool IsGeneric,
    required String ChartType,
    required Map DataSourceNav,
    @Default(false) bool IsCurrencyFormat,
    required bool ShowOnApp,
    @Default("1") String DecimalDigits,
    String? Uom,
    required String Category,
    @Default(false) bool IsCard,
  }) = _PSCCTReport;
  factory PSCCTReport.fromJson(Map<String, dynamic> json) =>
      _$PSCCTReportFromJson(json);

  static xmlToJson(String xml) {
    if (xml.isNotEmpty) {
      var json = Helper.convertXmlToJsonList(xml);

      return json;
    } else
      return <Map<String, dynamic>>[];
  }
}

// Added constructor

// @JsonKey(fromJson: OverviewReport.xmlToJson) required String RawData,

/*static xmlToJson(String xml) {}

  factory OverviewReport.fromJson(Map<String, dynamic> json) =>
      _$OverviewReportFromJson(json);*/
