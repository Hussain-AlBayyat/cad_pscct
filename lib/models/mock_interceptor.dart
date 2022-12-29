import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:pscct/helper.dart';

class MockInterceptor extends Interceptor {
  static const _jsonDir = 'assets/mockup_data/';
  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // return handler.next(options);
    var response;
    if (options.path.contains(".json")) {
      response = await responseFromJson(options);
    } else {
      response = await responseFromXML(options);
    }
    return handler.resolve(response);
  }

  Future<Response> responseFromXML(
    RequestOptions options,
  ) async {
    final resourcePath = _jsonDir + options.path;
    final file = await rootBundle.loadString(resourcePath);
    var data = Helper.convertXmlToJsonList(file.toString());

    Response response = Response(
      data: data,
      statusCode: 200,
      requestOptions: options,
    );
    return response;
  }

  Future<Response> responseFromJson(
    RequestOptions options,
  ) async {
    final resourcePath = _jsonDir + options.path;
    final data = await rootBundle.load(resourcePath);
    final map = json.decode(
      utf8.decode(
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
      ),
    );

    Response response = Response(
      data: map,
      statusCode: 200,
      requestOptions: options,
    );
    return response;
  }
}
