import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:xml2json/xml2json.dart';

class Helper {
  static final Helper _helper = Helper._internal();

  factory Helper() {
    return _helper;
  }
  Helper._internal();

  static final _convertor = Xml2Json();
  static Map convertXmlToJson(String xml) {
    _convertor.parse(xml);
    var source = json.decode(_convertor.toParker());
    return source["asx:abap"]["asx:values"]["OUTPUT"]["item"];
  }

  static List<Map<String, dynamic>> convertXmlToJsonList(String xml) {
    _convertor.parse(xml);
    Map source = json.decode(_convertor.toParker());
    var values = source["asx:abap"]["asx:values"];
    var errors = source["asx:abap"]["asx:error"];
    Map meta = source["asx:abap"]["asx:values"]["META"];
    //print(x.values.map((e) => e["SCRTEXT_L"]));
    List columnNames = [];
    meta.values.forEach((element) {
      (element as List).forEach((e) {
        columnNames.add(e["SCRTEXT_L"]);
      });
    });

    //check if xml has values and not empty
    if (values != null) {
      var item = values["OUTPUT"]["item"];

      //values can be list of item or only an item '(Map)'
      if (item.runtimeType == List<dynamic>) {
        List<Map<String, dynamic>> items =
            List<Map<String, dynamic>>.from(item);
        List<Map<String, dynamic>> editedItems = [];
        items.forEach((element) {
          Map<String, dynamic> item = {};
          for (int i = 0; i < element.length; i++) {
            item[columnNames[i]] = element.values.toList()[i];
          }
          editedItems.add(item);

          /*  columnNames.forEach((column) {
            editedItems.add({column: element.values.first});
          });*/
        });
        return editedItems;
      } else {
        return <Map<String, dynamic>>[item];
      }
    }
    //xml has no values, now check if xml has error value
    else if (errors != null) {
      return <Map<String, dynamic>>[
        {"ERROR": errors}
      ];
    } else {
      //xml is empty = ""
      return <Map<String, dynamic>>[];
    }

    /*  return {
      "title": source["asx:abap"]["asx:values"]['metadata']["description"],
      "data":
          List<Map>.from(source["asx:abap"]["asx:values"]["OUTPUT"]["item"]),
      "valuesCount": List<Map>.from(source["asx:abap"]["asx:values"]['META']
                  ["ZBW_QUERY_OUTPUT_METADATA"])
              .length -
          1,
    };*/
  }

  static compactNumber(String value) {
    NumberFormat numberFormat = new NumberFormat.compact();

    try {
      numberFormat.maximumFractionDigits = 1;
      var number = numberFormat.format(
        double.parse(value),
      );
      return number;
    } catch (error) {
      return value;
    }
  }

  static compactNumber2(String value) {
    NumberFormat numberFormat = new NumberFormat.compact();
    try {
      return numberFormat
          .format(double.parse(value))
          .replaceAll("M", "MM")
          .replaceAll("K", "M");
    } catch (error) {
      return value;
    }
  }
}
