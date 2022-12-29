import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@Freezed()
class LoginState with _$LoginState {
  const factory LoginState.uninitialized() = Uninitialized;
  const factory LoginState.initialized({required bool isFirstTime}) =
      Initialized;
  const factory LoginState.loggedIn() = LoggedIn;
  const factory LoginState.fieldsChanged(String username, String password) =
      FieldsChanged;

  const factory LoginState.error({required String message}) = Error;
  const factory LoginState.loading() = Loading;
  const factory LoginState.reset(String url) = Reset;
}
