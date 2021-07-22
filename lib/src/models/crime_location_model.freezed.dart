// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'crime_location_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CrimeLocationModel _$CrimeLocationModelFromJson(Map<String, dynamic> json) {
  return _CrimeLocationModel.fromJson(json);
}

/// @nodoc
class _$CrimeLocationModelTearOff {
  const _$CrimeLocationModelTearOff();

  _CrimeLocationModel call(
      {double? latitude,
      double? longitude,
      int? reportNumber,
      List<String>? crimeImages}) {
    return _CrimeLocationModel(
      latitude: latitude,
      longitude: longitude,
      reportNumber: reportNumber,
      crimeImages: crimeImages,
    );
  }

  CrimeLocationModel fromJson(Map<String, Object> json) {
    return CrimeLocationModel.fromJson(json);
  }
}

/// @nodoc
const $CrimeLocationModel = _$CrimeLocationModelTearOff();

/// @nodoc
mixin _$CrimeLocationModel {
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  int? get reportNumber => throw _privateConstructorUsedError;
  List<String>? get crimeImages => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CrimeLocationModelCopyWith<CrimeLocationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CrimeLocationModelCopyWith<$Res> {
  factory $CrimeLocationModelCopyWith(
          CrimeLocationModel value, $Res Function(CrimeLocationModel) then) =
      _$CrimeLocationModelCopyWithImpl<$Res>;
  $Res call(
      {double? latitude,
      double? longitude,
      int? reportNumber,
      List<String>? crimeImages});
}

/// @nodoc
class _$CrimeLocationModelCopyWithImpl<$Res>
    implements $CrimeLocationModelCopyWith<$Res> {
  _$CrimeLocationModelCopyWithImpl(this._value, this._then);

  final CrimeLocationModel _value;
  // ignore: unused_field
  final $Res Function(CrimeLocationModel) _then;

  @override
  $Res call({
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? reportNumber = freezed,
    Object? crimeImages = freezed,
  }) {
    return _then(_value.copyWith(
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      reportNumber: reportNumber == freezed
          ? _value.reportNumber
          : reportNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      crimeImages: crimeImages == freezed
          ? _value.crimeImages
          : crimeImages // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
abstract class _$CrimeLocationModelCopyWith<$Res>
    implements $CrimeLocationModelCopyWith<$Res> {
  factory _$CrimeLocationModelCopyWith(
          _CrimeLocationModel value, $Res Function(_CrimeLocationModel) then) =
      __$CrimeLocationModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {double? latitude,
      double? longitude,
      int? reportNumber,
      List<String>? crimeImages});
}

/// @nodoc
class __$CrimeLocationModelCopyWithImpl<$Res>
    extends _$CrimeLocationModelCopyWithImpl<$Res>
    implements _$CrimeLocationModelCopyWith<$Res> {
  __$CrimeLocationModelCopyWithImpl(
      _CrimeLocationModel _value, $Res Function(_CrimeLocationModel) _then)
      : super(_value, (v) => _then(v as _CrimeLocationModel));

  @override
  _CrimeLocationModel get _value => super._value as _CrimeLocationModel;

  @override
  $Res call({
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? reportNumber = freezed,
    Object? crimeImages = freezed,
  }) {
    return _then(_CrimeLocationModel(
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      reportNumber: reportNumber == freezed
          ? _value.reportNumber
          : reportNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      crimeImages: crimeImages == freezed
          ? _value.crimeImages
          : crimeImages // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_CrimeLocationModel implements _CrimeLocationModel {
  _$_CrimeLocationModel(
      {this.latitude, this.longitude, this.reportNumber, this.crimeImages});

  factory _$_CrimeLocationModel.fromJson(Map<String, dynamic> json) =>
      _$_$_CrimeLocationModelFromJson(json);

  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  final int? reportNumber;
  @override
  final List<String>? crimeImages;

  @override
  String toString() {
    return 'CrimeLocationModel(latitude: $latitude, longitude: $longitude, reportNumber: $reportNumber, crimeImages: $crimeImages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CrimeLocationModel &&
            (identical(other.latitude, latitude) ||
                const DeepCollectionEquality()
                    .equals(other.latitude, latitude)) &&
            (identical(other.longitude, longitude) ||
                const DeepCollectionEquality()
                    .equals(other.longitude, longitude)) &&
            (identical(other.reportNumber, reportNumber) ||
                const DeepCollectionEquality()
                    .equals(other.reportNumber, reportNumber)) &&
            (identical(other.crimeImages, crimeImages) ||
                const DeepCollectionEquality()
                    .equals(other.crimeImages, crimeImages)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(latitude) ^
      const DeepCollectionEquality().hash(longitude) ^
      const DeepCollectionEquality().hash(reportNumber) ^
      const DeepCollectionEquality().hash(crimeImages);

  @JsonKey(ignore: true)
  @override
  _$CrimeLocationModelCopyWith<_CrimeLocationModel> get copyWith =>
      __$CrimeLocationModelCopyWithImpl<_CrimeLocationModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CrimeLocationModelToJson(this);
  }
}

abstract class _CrimeLocationModel implements CrimeLocationModel {
  factory _CrimeLocationModel(
      {double? latitude,
      double? longitude,
      int? reportNumber,
      List<String>? crimeImages}) = _$_CrimeLocationModel;

  factory _CrimeLocationModel.fromJson(Map<String, dynamic> json) =
      _$_CrimeLocationModel.fromJson;

  @override
  double? get latitude => throw _privateConstructorUsedError;
  @override
  double? get longitude => throw _privateConstructorUsedError;
  @override
  int? get reportNumber => throw _privateConstructorUsedError;
  @override
  List<String>? get crimeImages => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CrimeLocationModelCopyWith<_CrimeLocationModel> get copyWith =>
      throw _privateConstructorUsedError;
}
