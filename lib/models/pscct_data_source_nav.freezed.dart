// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pscct_data_source_nav.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PSCCTDataSourceNav _$PSCCTDataSourceNavFromJson(Map<String, dynamic> json) {
  return _PSCCTDataSourceNav.fromJson(json);
}

/// @nodoc
mixin _$PSCCTDataSourceNav {
  String get SourceId => throw _privateConstructorUsedError;
  String get TechnicalName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PSCCTDataSourceNavCopyWith<PSCCTDataSourceNav> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PSCCTDataSourceNavCopyWith<$Res> {
  factory $PSCCTDataSourceNavCopyWith(
          PSCCTDataSourceNav value, $Res Function(PSCCTDataSourceNav) then) =
      _$PSCCTDataSourceNavCopyWithImpl<$Res, PSCCTDataSourceNav>;
  @useResult
  $Res call({String SourceId, String TechnicalName});
}

/// @nodoc
class _$PSCCTDataSourceNavCopyWithImpl<$Res, $Val extends PSCCTDataSourceNav>
    implements $PSCCTDataSourceNavCopyWith<$Res> {
  _$PSCCTDataSourceNavCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? SourceId = null,
    Object? TechnicalName = null,
  }) {
    return _then(_value.copyWith(
      SourceId: null == SourceId
          ? _value.SourceId
          : SourceId // ignore: cast_nullable_to_non_nullable
              as String,
      TechnicalName: null == TechnicalName
          ? _value.TechnicalName
          : TechnicalName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PSCCTDataSourceNavCopyWith<$Res>
    implements $PSCCTDataSourceNavCopyWith<$Res> {
  factory _$$_PSCCTDataSourceNavCopyWith(_$_PSCCTDataSourceNav value,
          $Res Function(_$_PSCCTDataSourceNav) then) =
      __$$_PSCCTDataSourceNavCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String SourceId, String TechnicalName});
}

/// @nodoc
class __$$_PSCCTDataSourceNavCopyWithImpl<$Res>
    extends _$PSCCTDataSourceNavCopyWithImpl<$Res, _$_PSCCTDataSourceNav>
    implements _$$_PSCCTDataSourceNavCopyWith<$Res> {
  __$$_PSCCTDataSourceNavCopyWithImpl(
      _$_PSCCTDataSourceNav _value, $Res Function(_$_PSCCTDataSourceNav) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? SourceId = null,
    Object? TechnicalName = null,
  }) {
    return _then(_$_PSCCTDataSourceNav(
      SourceId: null == SourceId
          ? _value.SourceId
          : SourceId // ignore: cast_nullable_to_non_nullable
              as String,
      TechnicalName: null == TechnicalName
          ? _value.TechnicalName
          : TechnicalName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PSCCTDataSourceNav extends _PSCCTDataSourceNav {
  const _$_PSCCTDataSourceNav(
      {required this.SourceId, required this.TechnicalName})
      : super._();

  factory _$_PSCCTDataSourceNav.fromJson(Map<String, dynamic> json) =>
      _$$_PSCCTDataSourceNavFromJson(json);

  @override
  final String SourceId;
  @override
  final String TechnicalName;

  @override
  String toString() {
    return 'PSCCTDataSourceNav(SourceId: $SourceId, TechnicalName: $TechnicalName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PSCCTDataSourceNav &&
            (identical(other.SourceId, SourceId) ||
                other.SourceId == SourceId) &&
            (identical(other.TechnicalName, TechnicalName) ||
                other.TechnicalName == TechnicalName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, SourceId, TechnicalName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PSCCTDataSourceNavCopyWith<_$_PSCCTDataSourceNav> get copyWith =>
      __$$_PSCCTDataSourceNavCopyWithImpl<_$_PSCCTDataSourceNav>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PSCCTDataSourceNavToJson(
      this,
    );
  }
}

abstract class _PSCCTDataSourceNav extends PSCCTDataSourceNav {
  const factory _PSCCTDataSourceNav(
      {required final String SourceId,
      required final String TechnicalName}) = _$_PSCCTDataSourceNav;
  const _PSCCTDataSourceNav._() : super._();

  factory _PSCCTDataSourceNav.fromJson(Map<String, dynamic> json) =
      _$_PSCCTDataSourceNav.fromJson;

  @override
  String get SourceId;
  @override
  String get TechnicalName;
  @override
  @JsonKey(ignore: true)
  _$$_PSCCTDataSourceNavCopyWith<_$_PSCCTDataSourceNav> get copyWith =>
      throw _privateConstructorUsedError;
}
