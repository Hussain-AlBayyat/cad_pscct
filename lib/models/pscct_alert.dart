import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pscct/models/pscct.dart';

part 'pscct_alert.freezed.dart';
part 'pscct_alert.g.dart';

@Freezed()
class PSCCTAlert with _$PSCCTAlert {
  const PSCCTAlert._(); // Added constructor
  const factory PSCCTAlert({
    required String Title,
    required String Description,
    required String Value,
    required String Category,
    required String Criticality,
    required String OrderOnApp,
    @Default(false) bool IsCurrencyFormat,
    @Default("1") String DecimalDigits,
    String? Uom,
    required bool ShowOnApp,
    required bool Trend,
    required Map DataSourceNav,
  }) = _PSCCTAlert;

  factory PSCCTAlert.fromJson(Map<String, dynamic> json) =>
      _$PSCCTAlertFromJson(json);
}
