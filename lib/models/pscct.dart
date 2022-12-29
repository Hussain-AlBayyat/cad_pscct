import 'package:freezed_annotation/freezed_annotation.dart';
part 'pscct.freezed.dart';
part 'pscct.g.dart';

@Freezed()
class PSCCT with _$PSCCT {
  const PSCCT._(); // Added constructor

  const factory PSCCT({
    required String Title,
    required String Description,
    required String Category,
    required String CategoryText,
    required String Uom,
    required String OrderOnApp,
    required String IsCurrencyFormat,
    required String DecimalDigits,
    required bool ShowOnApp,
  }) = _PSCCT;
  factory PSCCT.fromJson(Map<String, dynamic> json) => _$PSCCTFromJson(json);
}
