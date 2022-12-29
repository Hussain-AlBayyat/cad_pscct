import 'package:bloc/bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pscct/blocs/login_bloc/login_state.dart';
import 'package:pscct/repositories/procurement_repository.dart';
import 'package:pscct/services/auth_service.dart';

import '../../repositories/pscct_repository.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const Uninitialized());
  late String _username, _password;
  String typedUserName = "", typedPassword = "";
  late String _url;
  bool _isLoggedIn = false, isFirstTime = true;
  late FlutterSecureStorage storage;
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
    _url = AuthService.portalUrl;
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
      //   typedPassword = "";
      //   typedUserName = "";
      // });
      bool isLoggedIn = await AuthService.login(typedUserName, typedPassword)
          .catchError((onError) {
        emit(Error(message: 'Error'));
      });
      //await Future.delayed(Duration(seconds: 2));
      if (isLoggedIn) {
        _saveCredential();
        typedPassword = "";
        typedUserName = "";
        isFirstTime = false;

        //   var reports = await procurementRepository.getReports();
        // print(reports);
        emit(LoggedIn());
      } else {
        typedPassword = "";
        typedUserName = "";
        emit(Error(
          message: "Error",
        ));
      }
    }
  }

  updateEnvironmentUrl() {
    AuthService.portalUrl = _url!;
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
