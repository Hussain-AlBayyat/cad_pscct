import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

class HttpService {
  static final HttpService _appHttpClient = HttpService._internal();
  factory HttpService() {
    // _dio.interceptors.add(MockInterceptor());

    return _appHttpClient;
  }

  HttpService._internal();

  static final Dio _dio = Dio();
  static List<CancelToken> _cancelTokens = [];
  static String cookie = '';

  static Future<Response> get({required String path, Options? options}) async {
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient dioClient) {
      dioClient.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);
      return dioClient;
    };
   // CancelToken cancelToken = CancelToken();
    Response response = await _dio.get(path,
        options: options ?? Options(receiveTimeout: 10000),
        );

    return response;
  }

  static addInterceptor({required Interceptor interceptorsWrapper}) {
    _dio.interceptors.add(interceptorsWrapper);
  }
}
