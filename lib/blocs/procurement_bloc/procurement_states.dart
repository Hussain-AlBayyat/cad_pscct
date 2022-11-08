import 'package:freezed_annotation/freezed_annotation.dart';
part 'procurement_states.freezed.dart';

@Freezed()
class ProcurementState with _$ProcurementState {
  const factory ProcurementState.uninitialized() = Uninitialized;
  const factory ProcurementState.loaded() = Loaded;
  const factory ProcurementState.error() = Error;
}
