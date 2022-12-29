import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:local_auth/local_auth.dart';
import 'package:pscct/services/http_service.dart';

import '../repositories/pscct_repository.dart';

class AuthService {
  static String _cookie = '';
  static String portalUrl = "https://dp4.aramco.com.sa/irj/portal";
  static String logoutUrl =
      "https://dp4.aramco.com.sa/aramco.com~it~ca~myhome~masthead/html/logoff.html";

  static String username = '';
  static String orgCode = '';
  static final LocalAuthentication _localAuthentication = LocalAuthentication();
  /*
  usr: Mohata0j
  pass: Bihana@9

  DVB User: T_BI_Alerts
  PW: Alerts_4
kidwaimo
Welcome.1
  DVP User: alsham0y
  PW: pscctapp&1
   */

  static Future<bool> logout() async {
    final response = await HttpService.get(path: logoutUrl);
    if (response.statusCode == 200) {
      _cookie = '';
      PSCCTRepository.clear();
      return true;
    }
    return false;
  }

  static Future<bool> login(String username, String password) async {
    String basicAuth =
        'Basic ' + base64Encode(ascii.encode('$username:$password'));
    Response response = await HttpService.get(
        path: portalUrl,
        options: Options(headers: {
          'Authorization': basicAuth,
          "Accept": "*/*",
          "Cache-Control": "no-cache",
          "Accept-Encoding": "gzip, deflate, br",
          "Connection": "keep-alive"
        }));

    //Successful login
    return _saveCookie(response);
  }

  static _saveCookie(Response response) {
    List<String>? headerCookie = response.headers["set-cookie"];
    // Extract cookie from header
    String start = "MYSAPSSO2=";
    String end = ";";
    int startIndex = headerCookie![0].indexOf(start);
    if (startIndex >= 0 && response.statusCode == 200) {
      int endIndex = headerCookie[0].indexOf(end, startIndex + start.length);
      _cookie = headerCookie[0].substring(startIndex + start.length, endIndex);
      _cookie = 'MYSAPSSO2=$_cookie';
      HttpService.addInterceptor(interceptorsWrapper: InterceptorsWrapper(
          onRequest:
              (RequestOptions options, RequestInterceptorHandler handler) {
        options.headers['cookie'] = _cookie;
        handler.next(options);
      }));
      return true;
    }
    return false;
  }

  static isBiometricSupported() async {
    bool isBiometricSupported = await _localAuthentication.isDeviceSupported();
    return isBiometricSupported;
  }

  static authenticateUser() async {
    //initialize Local Authentication plugin.
    final LocalAuthentication _localAuthentication = LocalAuthentication();

    //status of authentication.
    bool isAuthenticated = false;

    try {
      isAuthenticated = await _localAuthentication.authenticate(
          localizedReason: 'To continue, you must complete the biometrics',
          options: AuthenticationOptions(
              biometricOnly: true, useErrorDialogs: false, stickyAuth: true));
    } catch (e) {
      print(e);
    }
    // }

    return isAuthenticated;
  }
}
