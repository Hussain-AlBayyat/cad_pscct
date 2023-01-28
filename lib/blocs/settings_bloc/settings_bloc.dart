import 'package:bloc/bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pscct/blocs/settings_bloc/settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(const Uninitialized(isDarkMode: false));
  late String _isDarkMode;
  late FlutterSecureStorage storage;

  initialize() async {
    storage = FlutterSecureStorage();

    _isDarkMode = await storage.read(key: "isDarkMode") ?? "false";
    emit(Initialized(isDarkMode: _isDarkMode == "true" ? true : false));
  }

  changeTheme() {
    _isDarkMode = _isDarkMode == "true" ? "false" : "true";
    storage.write(key: "isDarkMode", value: _isDarkMode);
    emit(state.copyWith(isDarkMode: _isDarkMode == "true" ? true : false));
  }

  @override
  void onChange(Change<SettingsState> change) {
    super.onChange(change);
    print(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print('$error, $stackTrace');
    super.onError(error, stackTrace);
  }
}
