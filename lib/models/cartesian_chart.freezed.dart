// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'cartesian_chart.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CartesianChart _$CartesianChartFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'line':
      return _CartesianLineChart.fromJson(json);
    case 'bar':
      return _CartesianBarChart.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'CartesianChart',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$CartesianChart {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<dynamic, dynamic> data) line,
    required TResult Function() bar,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<dynamic, dynamic> data)? line,
    TResult? Function()? bar,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<dynamic, dynamic> data)? line,
    TResult Function()? bar,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CartesianLineChart value) line,
    required TResult Function(_CartesianBarChart value) bar,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CartesianLineChart value)? line,
    TResult? Function(_CartesianBarChart value)? bar,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CartesianLineChart value)? line,
    TResult Function(_CartesianBarChart value)? bar,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartesianChartCopyWith<$Res> {
  factory $CartesianChartCopyWith(
          CartesianChart value, $Res Function(CartesianChart) then) =
      _$CartesianChartCopyWithImpl<$Res, CartesianChart>;
}

/// @nodoc
class _$CartesianChartCopyWithImpl<$Res, $Val extends CartesianChart>
    implements $CartesianChartCopyWith<$Res> {
  _$CartesianChartCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_CartesianLineChartCopyWith<$Res> {
  factory _$$_CartesianLineChartCopyWith(_$_CartesianLineChart value,
          $Res Function(_$_CartesianLineChart) then) =
      __$$_CartesianLineChartCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<dynamic, dynamic> data});
}

/// @nodoc
class __$$_CartesianLineChartCopyWithImpl<$Res>
    extends _$CartesianChartCopyWithImpl<$Res, _$_CartesianLineChart>
    implements _$$_CartesianLineChartCopyWith<$Res> {
  __$$_CartesianLineChartCopyWithImpl(
      _$_CartesianLineChart _value, $Res Function(_$_CartesianLineChart) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$_CartesianLineChart(
      null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CartesianLineChart extends _CartesianLineChart {
  const _$_CartesianLineChart(final Map<dynamic, dynamic> data,
      {final String? $type})
      : _data = data,
        $type = $type ?? 'line',
        super._();

  factory _$_CartesianLineChart.fromJson(Map<String, dynamic> json) =>
      _$$_CartesianLineChartFromJson(json);

  final Map<dynamic, dynamic> _data;
  @override
  Map<dynamic, dynamic> get data {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'CartesianChart.line(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CartesianLineChart &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CartesianLineChartCopyWith<_$_CartesianLineChart> get copyWith =>
      __$$_CartesianLineChartCopyWithImpl<_$_CartesianLineChart>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<dynamic, dynamic> data) line,
    required TResult Function() bar,
  }) {
    return line(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<dynamic, dynamic> data)? line,
    TResult? Function()? bar,
  }) {
    return line?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<dynamic, dynamic> data)? line,
    TResult Function()? bar,
    required TResult orElse(),
  }) {
    if (line != null) {
      return line(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CartesianLineChart value) line,
    required TResult Function(_CartesianBarChart value) bar,
  }) {
    return line(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CartesianLineChart value)? line,
    TResult? Function(_CartesianBarChart value)? bar,
  }) {
    return line?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CartesianLineChart value)? line,
    TResult Function(_CartesianBarChart value)? bar,
    required TResult orElse(),
  }) {
    if (line != null) {
      return line(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_CartesianLineChartToJson(
      this,
    );
  }
}

abstract class _CartesianLineChart extends CartesianChart {
  const factory _CartesianLineChart(final Map<dynamic, dynamic> data) =
      _$_CartesianLineChart;
  const _CartesianLineChart._() : super._();

  factory _CartesianLineChart.fromJson(Map<String, dynamic> json) =
      _$_CartesianLineChart.fromJson;

  Map<dynamic, dynamic> get data;
  @JsonKey(ignore: true)
  _$$_CartesianLineChartCopyWith<_$_CartesianLineChart> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_CartesianBarChartCopyWith<$Res> {
  factory _$$_CartesianBarChartCopyWith(_$_CartesianBarChart value,
          $Res Function(_$_CartesianBarChart) then) =
      __$$_CartesianBarChartCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_CartesianBarChartCopyWithImpl<$Res>
    extends _$CartesianChartCopyWithImpl<$Res, _$_CartesianBarChart>
    implements _$$_CartesianBarChartCopyWith<$Res> {
  __$$_CartesianBarChartCopyWithImpl(
      _$_CartesianBarChart _value, $Res Function(_$_CartesianBarChart) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$_CartesianBarChart extends _CartesianBarChart {
  const _$_CartesianBarChart({final String? $type})
      : $type = $type ?? 'bar',
        super._();

  factory _$_CartesianBarChart.fromJson(Map<String, dynamic> json) =>
      _$$_CartesianBarChartFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'CartesianChart.bar()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_CartesianBarChart);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<dynamic, dynamic> data) line,
    required TResult Function() bar,
  }) {
    return bar();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<dynamic, dynamic> data)? line,
    TResult? Function()? bar,
  }) {
    return bar?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<dynamic, dynamic> data)? line,
    TResult Function()? bar,
    required TResult orElse(),
  }) {
    if (bar != null) {
      return bar();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CartesianLineChart value) line,
    required TResult Function(_CartesianBarChart value) bar,
  }) {
    return bar(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CartesianLineChart value)? line,
    TResult? Function(_CartesianBarChart value)? bar,
  }) {
    return bar?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CartesianLineChart value)? line,
    TResult Function(_CartesianBarChart value)? bar,
    required TResult orElse(),
  }) {
    if (bar != null) {
      return bar(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_CartesianBarChartToJson(
      this,
    );
  }
}

abstract class _CartesianBarChart extends CartesianChart {
  const factory _CartesianBarChart() = _$_CartesianBarChart;
  const _CartesianBarChart._() : super._();

  factory _CartesianBarChart.fromJson(Map<String, dynamic> json) =
      _$_CartesianBarChart.fromJson;
}
