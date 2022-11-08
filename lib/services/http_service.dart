import 'package:dio/dio.dart';
import 'package:pscct/models/mock_interceptor.dart';

class HttpService {
  static const String cookie = '';
  static const String baseUrl = "https://dp4.aramco.com.sa/newdesign";
  static final HttpService _appHttpClient = HttpService._internal();

  factory HttpService() {
    _dio.interceptors.add(MockInterceptor());
    return _appHttpClient;
  }
  HttpService._internal();

  static final Dio _dio = Dio();

  static get({required String path, Options? options}) async {
    var x = await _dio.get(path, options: options);
    print(x);
    return x;
  }
}
