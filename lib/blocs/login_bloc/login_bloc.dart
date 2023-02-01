import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:no_context_navigation/no_context_navigation.dart';
import 'package:pscct/blocs/login_bloc/login_state.dart';
import 'package:pscct/repositories/procurement_repository.dart';
import 'package:pscct/services/auth_service.dart';

import '../../router.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const Uninitialized());
  late String _username, _password;
  String typedUserName = "", typedPassword = "";
  late String _url;
  bool _isLoggedIn = false, isFirstTime = true;
  late FlutterSecureStorage storage;
  static Timer? _timer;
  bool isTimedOut = false;
  static const autoLogoutTimer = 30;
  final androidOptions = AndroidOptions(encryptedSharedPreferences: true);
  final iosOption =
      IOSOptions(accessibility: KeychainAccessibility.first_unlock);
  ProcurementRepository procurementRepository = ProcurementRepository();

  initialize() async {
    setupStorage();
    await _readCredential();
    bool isBiometricSupported = await AuthService.isBiometricSupported();

    if (_username.isNotEmpty && _password.isNotEmpty && isBiometricSupported)
      //User signed in before - show face Id button
      isFirstTime = false;
    _url = AuthService.authUrl;
    emit(Initialized(isFirstTime: isFirstTime));
  }

  void usernameChanged(String username) {
    typedUserName = username;
    emit(FieldsChanged(typedUserName, typedPassword));
  }

  void passwordChanged(String password) {
    typedPassword = password;
    emit(FieldsChanged(typedPassword, typedPassword));
  }

  void urlChanged(String url) {
    _url = url;
  }

  canLogin() {
    return typedPassword.isNotEmpty && typedUserName.isNotEmpty;
  }

  Future<void> login() async {
    if (typedUserName!.toLowerCase() == "reset") {
      emit(Reset(_url));
    } else {
      emit(Loading());
      //"Mohata0j" , "Bihana@9"
      // bool isLoggedIn =
      //     await AuthService.login("Mohata0j", "Bihana@9").catchError((onError) {
      //   emit(Error(message: 'Error'));
      //   typedPassword = ""; SID_BWSCM_01
      //   typedUserName = ""; Sb2hj26ZLoG6nJiwCDH2nx7HKMr2nyDr

      // });
      // procurementRepository.getProcurementReports();

      _isLoggedIn = await AuthService.login(typedUserName, typedPassword)
          .catchError((onError) {
        typedPassword = "";

        emit(Error(message: (onError as DioError).error.toString()));
      });
      //await Future.delayed(Duration(seconds: 2));

      if (_isLoggedIn) {
        _saveCredential();
        isFirstTime = false;
        isTimedOut = false;
        typedPassword = "";
        typedUserName = "";
        emit(LoggedIn());
        await Future.wait([
          procurementRepository.getProcurementReports(),
          procurementRepository.getProcurementAlerts(),
          procurementRepository.getProcurementKpis()
        ]);
      } else {
        typedPassword = "";

        emit(Error(
          message: "Error signing you in",
        ));
      }
    }
  }

  isLoggedIn() => _isLoggedIn;

  logOut() async {
    await AuthService.logout();
    _isLoggedIn = false;
    //sessionConfig.dispose();
    emit(LoggedOut(isTimedOut));
    navService.pushReplacementNamed(AppRouter.loginRoute);
  }

  updateEnvironmentUrl() {
    AuthService.authUrl = _url!;
    emit(Initialized(isFirstTime: isFirstTime));
  }

  setupStorage() {
    storage = FlutterSecureStorage();
    storage.aOptions.copyWith(encryptedSharedPreferences: true);
    storage.iOptions
        .copyWith(accessibility: KeychainAccessibility.first_unlock);
  }

  _readCredential() async {
    _username = await storage.read(key: "username") ?? "";
    _password = await storage.read(key: "password") ?? "";
  }

  _saveCredential() {
    storage.write(
      key: "username",
      value: typedUserName,
    );
    storage.write(key: "password", value: typedPassword);
  }

  loginWithBiometric() async {
    bool isAuthenticated = await AuthService.authenticateUser();
    if (isAuthenticated) {
      emit(Loading());
      typedUserName = _username;
      typedPassword = _password;
      login();
    }
  }

  void startNewTimer() {
    stopTimer();
    if (_isLoggedIn) {
      print("timer started");
      _timer = Timer.periodic(const Duration(minutes: autoLogoutTimer), (_) {
        isTimedOut = true;
        timedOut();
      });
    }
  }

  /// Stops the existing timer if it exists
  void stopTimer() {
    if (_timer != null || (_timer?.isActive != null && _timer!.isActive)) {
      _timer?.cancel();
    }
  }

  /// Track user activity and reset timer
  void trackUserActivity([_]) async {
    print('User Activity Detected!');
    if (_isLoggedIn && _timer != null) {
      startNewTimer();
    }
  }

  /// Called if the user is inactive for a period of time and opens a dialog
  Future<void> timedOut() async {
    stopTimer();
    if (_isLoggedIn) {
// Logout the user and pass the reason to the Auth Service

      logOut();
    }
  }

  @override
  void onChange(Change<LoginState> change) {
    super.onChange(change);
    print(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print('$error, $stackTrace');
    super.onError(error, stackTrace);
  }
}
