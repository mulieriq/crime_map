// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crime_location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CrimeLocationModel _$_$_CrimeLocationModelFromJson(
    Map<String, dynamic> json) {
  return _$_CrimeLocationModel(
    latitude: (json['latitude'] as num?)?.toDouble(),
    longitude: (json['longitude'] as num?)?.toDouble(),
    reportNumber: json['reportNumber'] as int?,
    crimeImages: (json['crimeImages'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
  );
}

Map<String, dynamic> _$_$_CrimeLocationModelToJson(
        _$_CrimeLocationModel instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'reportNumber': instance.reportNumber,
      'crimeImages': instance.crimeImages,
    };
