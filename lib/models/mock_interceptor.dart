import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

class MockInterceptor extends Interceptor {
  static const _jsonDir = 'assets/mockup_data/';
  static const _jsonExtension = '.json';
  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final resourcePath = _jsonDir + options.path + _jsonExtension;
    final data = await rootBundle.load(resourcePath);
    final map = json.decode(
      utf8.decode(
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
      ),
    );

    Response response = Response(
      data: map["d"]["results"],
      statusCode: 200,
      requestOptions: options,
    );

    return handler.resolve(response);
  }
}
