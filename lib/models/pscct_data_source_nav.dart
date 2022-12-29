import 'package:freezed_annotation/freezed_annotation.dart';

part 'pscct_data_source_nav.freezed.dart';
part 'pscct_data_source_nav.g.dart';

@Freezed()
class PSCCTDataSourceNav with _$PSCCTDataSourceNav {
  const PSCCTDataSourceNav._(); // Added constructor
  const factory PSCCTDataSourceNav({
    required String SourceId,
    required String TechnicalName,
  }) = _PSCCTDataSourceNav;

  factory PSCCTDataSourceNav.fromJson(Map<String, dynamic> json) =>
      _$PSCCTDataSourceNavFromJson(json);
}
