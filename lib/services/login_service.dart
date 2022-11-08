import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:pscct/services/http_service.dart';

class LoginService {
  static String cookie = '';
  static String portalUrl = "https://dp4.aramco.com.sa/irj/portal";
  static String username = '';
  static String orgCode = '';
  static Future<bool> login(String username, String password) async {
    LoginService.username = username;

    // if (CommonConst.isOffline) return true;

    String basicAuth =
        'Basic ' + base64Encode(ascii.encode('$username:$password'));

    final response = await HttpService.get(
        path: portalUrl,
        options: Options(headers: {
          'Authorization': basicAuth,
          "Accept": "*/*",
          "Cache-Control": "no-cache",
          "Accept-Encoding": "gzip, deflate, br",
          "Connection": "keep-alive"
        }));

    String headerCookie = response.headers["Set-Cookie"] as String;

    // Extract cookie from header
    String start = "MYSAPSSO2=";
    String end = ";";
    int startIndex = headerCookie.indexOf(start);
    if (startIndex >= 0) {
      int endIndex = headerCookie.indexOf(end, startIndex + start.length);
      cookie = headerCookie.substring(startIndex + start.length, endIndex);
      print("cookie: $cookie");

      cookie = 'MYSAPSSO2=$cookie';

      return true;
    }

    return false;
  }
}
