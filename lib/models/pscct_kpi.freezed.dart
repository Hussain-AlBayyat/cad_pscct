// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pscct_kpi.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PSCCTKpi _$PSCCTKpiFromJson(Map<String, dynamic> json) {
  return _PSCCTKpi.fromJson(json);
}

/// @nodoc
mixin _$PSCCTKpi {
  String get title => throw _privateConstructorUsedError;
  num get value => throw _privateConstructorUsedError;
  num get target => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PSCCTKpiCopyWith<PSCCTKpi> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PSCCTKpiCopyWith<$Res> {
  factory $PSCCTKpiCopyWith(PSCCTKpi value, $Res Function(PSCCTKpi) then) =
      _$PSCCTKpiCopyWithImpl<$Res, PSCCTKpi>;
  @useResult
  $Res call({String title, num value, num target});
}

/// @nodoc
class _$PSCCTKpiCopyWithImpl<$Res, $Val extends PSCCTKpi>
    implements $PSCCTKpiCopyWith<$Res> {
  _$PSCCTKpiCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? value = null,
    Object? target = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_PSCCTKpiCopyWith<$Res> implements $PSCCTKpiCopyWith<$Res> {
  factory _$$_PSCCTKpiCopyWith(
          _$_PSCCTKpi value, $Res Function(_$_PSCCTKpi) then) =
      __$$_PSCCTKpiCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, num value, num target});
}

/// @nodoc
class __$$_PSCCTKpiCopyWithImpl<$Res>
    extends _$PSCCTKpiCopyWithImpl<$Res, _$_PSCCTKpi>
    implements _$$_PSCCTKpiCopyWith<$Res> {
  __$$_PSCCTKpiCopyWithImpl(
      _$_PSCCTKpi _value, $Res Function(_$_PSCCTKpi) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? value = null,
    Object? target = null,
  }) {
    return _then(_$_PSCCTKpi(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
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
class _$_PSCCTKpi extends _PSCCTKpi {
  const _$_PSCCTKpi(
      {required this.title, required this.value, required this.target})
      : super._();

  factory _$_PSCCTKpi.fromJson(Map<String, dynamic> json) =>
      _$$_PSCCTKpiFromJson(json);

  @override
  final String title;
  @override
  final num value;
  @override
  final num target;

  @override
  String toString() {
    return 'PSCCTKpi(title: $title, value: $value, target: $target)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PSCCTKpi &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.target, target) || other.target == target));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, value, target);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PSCCTKpiCopyWith<_$_PSCCTKpi> get copyWith =>
      __$$_PSCCTKpiCopyWithImpl<_$_PSCCTKpi>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PSCCTKpiToJson(
      this,
    );
  }
}

abstract class _PSCCTKpi extends PSCCTKpi {
  const factory _PSCCTKpi(
      {required final String title,
      required final num value,
      required final num target}) = _$_PSCCTKpi;
  const _PSCCTKpi._() : super._();

  factory _PSCCTKpi.fromJson(Map<String, dynamic> json) = _$_PSCCTKpi.fromJson;

  @override
  String get title;
  @override
  num get value;
  @override
  num get target;
  @override
  @JsonKey(ignore: true)
  _$$_PSCCTKpiCopyWith<_$_PSCCTKpi> get copyWith =>
      throw _privateConstructorUsedError;
}
