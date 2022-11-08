// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pscct_alert.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PSCCTAlert _$PSCCTAlertFromJson(Map<String, dynamic> json) {
  return _PSCCTAlert.fromJson(json);
}

/// @nodoc
mixin _$PSCCTAlert {
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  num get value => throw _privateConstructorUsedError;
  num get target => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PSCCTAlertCopyWith<PSCCTAlert> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PSCCTAlertCopyWith<$Res> {
  factory $PSCCTAlertCopyWith(
          PSCCTAlert value, $Res Function(PSCCTAlert) then) =
      _$PSCCTAlertCopyWithImpl<$Res, PSCCTAlert>;
  @useResult
  $Res call({String title, String description, num value, num target});
}

/// @nodoc
class _$PSCCTAlertCopyWithImpl<$Res, $Val extends PSCCTAlert>
    implements $PSCCTAlertCopyWith<$Res> {
  _$PSCCTAlertCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? value = null,
    Object? target = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as num,
      target: null == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as num,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PSCCTAlertCopyWith<$Res>
    implements $PSCCTAlertCopyWith<$Res> {
  factory _$$_PSCCTAlertCopyWith(
          _$_PSCCTAlert value, $Res Function(_$_PSCCTAlert) then) =
      __$$_PSCCTAlertCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String description, num value, num target});
}

/// @nodoc
class __$$_PSCCTAlertCopyWithImpl<$Res>
    extends _$PSCCTAlertCopyWithImpl<$Res, _$_PSCCTAlert>
    implements _$$_PSCCTAlertCopyWith<$Res> {
  __$$_PSCCTAlertCopyWithImpl(
      _$_PSCCTAlert _value, $Res Function(_$_PSCCTAlert) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? value = null,
    Object? target = null,
  }) {
    return _then(_$_PSCCTAlert(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as num,
      target: null == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PSCCTAlert extends _PSCCTAlert {
  const _$_PSCCTAlert(
      {required this.title,
      required this.description,
      required this.value,
      required this.target})
      : super._();

  factory _$_PSCCTAlert.fromJson(Map<String, dynamic> json) =>
      _$$_PSCCTAlertFromJson(json);

  @override
  final String title;
  @override
  final String description;
  @override
  final num value;
  @override
  final num target;

  @override
  String toString() {
    return 'PSCCTAlert(title: $title, description: $description, value: $value, target: $target)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PSCCTAlert &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.target, target) || other.target == target));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, title, description, value, target);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PSCCTAlertCopyWith<_$_PSCCTAlert> get copyWith =>
      __$$_PSCCTAlertCopyWithImpl<_$_PSCCTAlert>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PSCCTAlertToJson(
      this,
    );
  }
}

abstract class _PSCCTAlert extends PSCCTAlert {
  const factory _PSCCTAlert(
      {required final String title,
      required final String description,
      required final num value,
      required final num target}) = _$_PSCCTAlert;
  const _PSCCTAlert._() : super._();

  factory _PSCCTAlert.fromJson(Map<String, dynamic> json) =
      _$_PSCCTAlert.fromJson;

  @override
  String get title;
  @override
  String get description;
  @override
  num get value;
  @override
  num get target;
  @override
  @JsonKey(ignore: true)
  _$$_PSCCTAlertCopyWith<_$_PSCCTAlert> get copyWith =>
      throw _privateConstructorUsedError;
}
