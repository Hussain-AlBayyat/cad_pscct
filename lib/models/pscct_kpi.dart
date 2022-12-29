import 'package:freezed_annotation/freezed_annotation.dart';

part 'pscct_kpi.freezed.dart';
part 'pscct_kpi.g.dart';

@Freezed()
class PSCCTKpi with _$PSCCTKpi {
  const PSCCTKpi._(); // Added constructor
  const factory PSCCTKpi({
    required String Title,
    required String Description,
    required String Category,
    required String CategoryText,
    required String KPIId,
    required bool Inversed,
    required String Value,
    required String Target,
    required bool ShowOnApp,
    @Default(false) bool IsCurrencyFormat,
    @Default("1") String DecimalDigits,
    String? Uom,
    required String OrderOnApp,
    required String ManualValue,
  }) = _PSCCTKpi;
  factory PSCCTKpi.fromJson(Map<String, dynamic> json) =>
      _$PSCCTKpiFromJson(json);
}
