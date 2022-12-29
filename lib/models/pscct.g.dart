// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pscct.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PSCCT _$$_PSCCTFromJson(Map<String, dynamic> json) => _$_PSCCT(
      Title: json['Title'] as String,
      Description: json['Description'] as String,
      Category: json['Category'] as String,
      CategoryText: json['CategoryText'] as String,
      Uom: json['Uom'] as String,
      OrderOnApp: json['OrderOnApp'] as String,
      IsCurrencyFormat: json['IsCurrencyFormat'] as String,
      DecimalDigits: json['DecimalDigits'] as String,
      ShowOnApp: json['ShowOnApp'] as bool,
    );

Map<String, dynamic> _$$_PSCCTToJson(_$_PSCCT instance) => <String, dynamic>{
      'Title': instance.Title,
      'Description': instance.Description,
      'Category': instance.Category,
      'CategoryText': instance.CategoryText,
      'Uom': instance.Uom,
      'OrderOnApp': instance.OrderOnApp,
      'IsCurrencyFormat': instance.IsCurrencyFormat,
      'DecimalDigits': instance.DecimalDigits,
      'ShowOnApp': instance.ShowOnApp,
    };
