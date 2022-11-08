// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pscct_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PSCCTReport _$$_PSCCTReportFromJson(Map<String, dynamic> json) =>
    _$_PSCCTReport(
      Title: json['Title'] as String,
      CompId: json['CompId'] as String,
      Order: json['Order'] as String,
      isActive: json['isActive'] as bool,
      CategoryText: json['CategoryText'] as String,
    );

Map<String, dynamic> _$$_PSCCTReportToJson(_$_PSCCTReport instance) =>
    <String, dynamic>{
      'Title': instance.Title,
      'CompId': instance.CompId,
      'Order': instance.Order,
      'isActive': instance.isActive,
      'CategoryText': instance.CategoryText,
    };
