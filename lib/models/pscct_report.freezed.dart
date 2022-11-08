// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pscct_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PSCCTReport _$PSCCTReportFromJson(Map<String, dynamic> json) {
  return _PSCCTReport.fromJson(json);
}

/// @nodoc
mixin _$PSCCTReport {
  String get Title => throw _privateConstructorUsedError;
  String get CompId => throw _privateConstructorUsedError;
  String get Order => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  String get CategoryText => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PSCCTReportCopyWith<PSCCTReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PSCCTReportCopyWith<$Res> {
  factory $PSCCTReportCopyWith(
          PSCCTReport value, $Res Function(PSCCTReport) then) =
      _$PSCCTReportCopyWithImpl<$Res, PSCCTReport>;
  @useResult
  $Res call(
      {String Title,
      String CompId,
      String Order,
      bool isActive,
      String CategoryText});
}

/// @nodoc
class _$PSCCTReportCopyWithImpl<$Res, $Val extends PSCCTReport>
    implements $PSCCTReportCopyWith<$Res> {
  _$PSCCTReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? Title = null,
    Object? CompId = null,
    Object? Order = null,
    Object? isActive = null,
    Object? CategoryText = null,
  }) {
    return _then(_value.copyWith(
      Title: null == Title
          ? _value.Title
          : Title // ignore: cast_nullable_to_non_nullable
              as String,
      CompId: null == CompId
          ? _value.CompId
          : CompId // ignore: cast_nullable_to_non_nullable
              as String,
      Order: null == Order
          ? _value.Order
          : Order // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      CategoryText: null == CategoryText
          ? _value.CategoryText
          : CategoryText // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PSCCTReportCopyWith<$Res>
    implements $PSCCTReportCopyWith<$Res> {
  factory _$$_PSCCTReportCopyWith(
          _$_PSCCTReport value, $Res Function(_$_PSCCTReport) then) =
      __$$_PSCCTReportCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String Title,
      String CompId,
      String Order,
      bool isActive,
      String CategoryText});
}

/// @nodoc
class __$$_PSCCTReportCopyWithImpl<$Res>
    extends _$PSCCTReportCopyWithImpl<$Res, _$_PSCCTReport>
    implements _$$_PSCCTReportCopyWith<$Res> {
  __$$_PSCCTReportCopyWithImpl(
      _$_PSCCTReport _value, $Res Function(_$_PSCCTReport) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? Title = null,
    Object? CompId = null,
    Object? Order = null,
    Object? isActive = null,
    Object? CategoryText = null,
  }) {
    return _then(_$_PSCCTReport(
      Title: null == Title
          ? _value.Title
          : Title // ignore: cast_nullable_to_non_nullable
              as String,
      CompId: null == CompId
          ? _value.CompId
          : CompId // ignore: cast_nullable_to_non_nullable
              as String,
      Order: null == Order
          ? _value.Order
          : Order // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      CategoryText: null == CategoryText
          ? _value.CategoryText
          : CategoryText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PSCCTReport extends _PSCCTReport {
  const _$_PSCCTReport(
      {required this.Title,
      required this.CompId,
      required this.Order,
      required this.isActive,
      required this.CategoryText})
      : super._();

  factory _$_PSCCTReport.fromJson(Map<String, dynamic> json) =>
      _$$_PSCCTReportFromJson(json);

  @override
  final String Title;
  @override
  final String CompId;
  @override
  final String Order;
  @override
  final bool isActive;
  @override
  final String CategoryText;

  @override
  String toString() {
    return 'PSCCTReport(Title: $Title, CompId: $CompId, Order: $Order, isActive: $isActive, CategoryText: $CategoryText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PSCCTReport &&
            (identical(other.Title, Title) || other.Title == Title) &&
            (identical(other.CompId, CompId) || other.CompId == CompId) &&
            (identical(other.Order, Order) || other.Order == Order) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.CategoryText, CategoryText) ||
                other.CategoryText == CategoryText));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, Title, CompId, Order, isActive, CategoryText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PSCCTReportCopyWith<_$_PSCCTReport> get copyWith =>
      __$$_PSCCTReportCopyWithImpl<_$_PSCCTReport>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PSCCTReportToJson(
      this,
    );
  }
}

abstract class _PSCCTReport extends PSCCTReport {
  const factory _PSCCTReport(
      {required final String Title,
      required final String CompId,
      required final String Order,
      required final bool isActive,
      required final String CategoryText}) = _$_PSCCTReport;
  const _PSCCTReport._() : super._();

  factory _PSCCTReport.fromJson(Map<String, dynamic> json) =
      _$_PSCCTReport.fromJson;

  @override
  String get Title;
  @override
  String get CompId;
  @override
  String get Order;
  @override
  bool get isActive;
  @override
  String get CategoryText;
  @override
  @JsonKey(ignore: true)
  _$$_PSCCTReportCopyWith<_$_PSCCTReport> get copyWith =>
      throw _privateConstructorUsedError;
}
