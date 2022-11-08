import 'dart:convert';

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
    var source = json.decode(_convertor.toParker());
    return List<Map<String, dynamic>>.from(
        source["asx:abap"]["asx:values"]["OUTPUT"]["item"]);

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
}
