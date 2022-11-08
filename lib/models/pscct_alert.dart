import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pscct/constants.dart';
import 'package:pscct/helper.dart';
part 'pscct_alert.freezed.dart';
part 'pscct_alert.g.dart';

@Freezed()
class PSCCTAlert with _$PSCCTAlert {
  const PSCCTAlert._(); // Added constructor
  const factory PSCCTAlert({
    required String title,
    required String description,
    required num value,
    required num target,
  }) = _PSCCTAlert;

  factory PSCCTAlert.fromJson(Map<String, dynamic> json) =>
      _$PSCCTAlertFromJson(json);

  factory PSCCTAlert.fromBWXml(String xml) {
    var alert = Helper.convertXmlToJson(xml);

    return PSCCTAlert(
        title: alert.values.first,
        description: "",
        value: int.parse(alert[Constants.value001]),
        target: int.parse(alert[Constants.value002]));
  }
}
