// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pscct_alert.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PSCCTAlert _$$_PSCCTAlertFromJson(Map<String, dynamic> json) =>
    _$_PSCCTAlert(
      Title: json['Title'] as String,
      Description: json['Description'] as String,
      Value: json['Value'] as String,
      Category: json['Category'] as String,
      Criticality: json['Criticality'] as String,
      OrderOnApp: json['OrderOnApp'] as String,
      IsCurrencyFormat: json['IsCurrencyFormat'] as bool? ?? false,
      DecimalDigits: json['DecimalDigits'] as String? ?? "1",
      Uom: json['Uom'] as String?,
      ShowOnApp: json['ShowOnApp'] as bool,
      Trend: json['Trend'] as bool,
      DataSourceNav: json['DataSourceNav'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$$_PSCCTAlertToJson(_$_PSCCTAlert instance) =>
    <String, dynamic>{
      'Title': instance.Title,
      'Description': instance.Description,
      'Value': instance.Value,
      'Category': instance.Category,
      'Criticality': instance.Criticality,
      'OrderOnApp': instance.OrderOnApp,
      'IsCurrencyFormat': instance.IsCurrencyFormat,
      'DecimalDigits': instance.DecimalDigits,
      'Uom': instance.Uom,
      'ShowOnApp': instance.ShowOnApp,
      'Trend': instance.Trend,
      'DataSourceNav': instance.DataSourceNav,
    };
