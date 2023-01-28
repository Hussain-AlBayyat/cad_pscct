import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_state.freezed.dart';

@Freezed()
class SettingsState with _$SettingsState {
  const factory SettingsState.uninitialized({required bool isDarkMode}) =
      Uninitialized;
  const factory SettingsState.initialized({required bool isDarkMode}) =
      Initialized;
}
