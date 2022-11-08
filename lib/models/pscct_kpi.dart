import 'package:freezed_annotation/freezed_annotation.dart';
part 'pscct_kpi.freezed.dart';
part 'pscct_kpi.g.dart';

@Freezed()
class PSCCTKpi with _$PSCCTKpi {
  const PSCCTKpi._(); // Added constructor
  const factory PSCCTKpi({
    required String title,
    required num value,
    required num target,
  }) = _PSCCTKpi;
  factory PSCCTKpi.fromJson(Map<String, dynamic> json) =>
      _$PSCCTKpiFromJson(json);
}
