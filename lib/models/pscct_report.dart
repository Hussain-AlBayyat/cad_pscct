import 'package:freezed_annotation/freezed_annotation.dart';
part 'pscct_report.freezed.dart';
part 'pscct_report.g.dart';

@Freezed()
class PSCCTReport with _$PSCCTReport {
  const PSCCTReport._(); // Added constructor

  const factory PSCCTReport({
    required String Title,
    required String CompId,
    required String Order,
    required bool isActive,
    required String CategoryText,
  }) = _PSCCTReport;
  factory PSCCTReport.fromJson(Map<String, dynamic> json) =>
      _$PSCCTReportFromJson(json);
}

// Added constructor

// @JsonKey(fromJson: OverviewReport.xmlToJson) required String RawData,

/*static xmlToJson(String xml) {}

  factory OverviewReport.fromJson(Map<String, dynamic> json) =>
      _$OverviewReportFromJson(json);*/
