// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pscct_alert.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PSCCTAlert _$$_PSCCTAlertFromJson(Map<String, dynamic> json) =>
    _$_PSCCTAlert(
      title: json['title'] as String,
      description: json['description'] as String,
      value: json['value'] as num,
      target: json['target'] as num,
    );

Map<String, dynamic> _$$_PSCCTAlertToJson(_$_PSCCTAlert instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'value': instance.value,
      'target': instance.target,
    };
