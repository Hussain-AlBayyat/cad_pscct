// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pscct_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PSCCTReport _$$_PSCCTReportFromJson(Map<String, dynamic> json) =>
    _$_PSCCTReport(
      Title: json['Title'] as String,
      Description: json['Description'] as String,
      CategoryText: json['CategoryText'] as String,
      RawData: PSCCTReport.xmlToJson(json['RawData'] as String),
      OrderOnApp: json['OrderOnApp'] as String,
      ComponentKey: json['ComponentKey'] as String,
      ImageKey: json['ImageKey'] as String,
      IsGeneric: json['IsGeneric'] as bool,
      ChartType: json['ChartType'] as String,
      DataSourceNav: json['DataSourceNav'] as Map<String, dynamic>,
      IsCurrencyFormat: json['IsCurrencyFormat'] as bool? ?? false,
      ShowOnApp: json['ShowOnApp'] as bool,
      DecimalDigits: json['DecimalDigits'] as String? ?? "1",
      Uom: json['Uom'] as String?,
      Category: json['Category'] as String,
      IsCard: json['IsCard'] as bool? ?? false,
    );

Map<String, dynamic> _$$_PSCCTReportToJson(_$_PSCCTReport instance) =>
    <String, dynamic>{
      'Title': instance.Title,
      'Description': instance.Description,
      'CategoryText': instance.CategoryText,
      'RawData': instance.RawData,
      'OrderOnApp': instance.OrderOnApp,
      'ComponentKey': instance.ComponentKey,
      'ImageKey': instance.ImageKey,
      'IsGeneric': instance.IsGeneric,
      'ChartType': instance.ChartType,
      'DataSourceNav': instance.DataSourceNav,
      'IsCurrencyFormat': instance.IsCurrencyFormat,
      'ShowOnApp': instance.ShowOnApp,
      'DecimalDigits': instance.DecimalDigits,
      'Uom': instance.Uom,
      'Category': instance.Category,
      'IsCard': instance.IsCard,
    };
