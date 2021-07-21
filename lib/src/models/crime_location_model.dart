import 'package:freezed_annotation/freezed_annotation.dart';

part 'crime_location_model.freezed.dart';
part 'crime_location_model.g.dart';

@freezed
abstract class CrimeLocationModel with _$CrimeLocationModel {
  factory CrimeLocationModel(
      {String? latitude,
      String? longitude,
      int? reportNumber,
      List<String>? crimeImages}) = _CrimeLocationModel;

  factory CrimeLocationModel.fromJson(Map<String, dynamic> json) =>
      _$CrimeLocationModelFromJson(json);
}
