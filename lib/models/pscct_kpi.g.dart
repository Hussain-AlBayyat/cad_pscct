// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pscct_kpi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PSCCTKpi _$$_PSCCTKpiFromJson(Map<String, dynamic> json) => _$_PSCCTKpi(
      Title: json['Title'] as String,
      Description: json['Description'] as String,
      Category: json['Category'] as String,
      CategoryText: json['CategoryText'] as String,
      CompId: json['CompId'] as String,
      Inversed: json['Inversed'] as bool,
      Value: json['Value'] as String,
      Trend: json['Trend'] as bool,
      Target: json['Target'] as String,
      ShowOnApp: json['ShowOnApp'] as bool,
      IsCurrencyFormat: json['IsCurrencyFormat'] as bool? ?? false,
      DecimalDigits: json['DecimalDigits'] as String? ?? "1",
      Uom: json['Uom'] as String?,
      OrderOnApp: json['OrderOnApp'] as String,
      ManualValue: json['ManualValue'] as String,
      DataSourceNav: json['DataSourceNav'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$$_PSCCTKpiToJson(_$_PSCCTKpi instance) =>
    <String, dynamic>{
      'Title': instance.Title,
      'Description': instance.Description,
      'Category': instance.Category,
      'CategoryText': instance.CategoryText,
      'CompId': instance.CompId,
      'Inversed': instance.Inversed,
      'Value': instance.Value,
      'Trend': instance.Trend,
      'Target': instance.Target,
      'ShowOnApp': instance.ShowOnApp,
      'IsCurrencyFormat': instance.IsCurrencyFormat,
      'DecimalDigits': instance.DecimalDigits,
      'Uom': instance.Uom,
      'OrderOnApp': instance.OrderOnApp,
      'ManualValue': instance.ManualValue,
      'DataSourceNav': instance.DataSourceNav,
    };
