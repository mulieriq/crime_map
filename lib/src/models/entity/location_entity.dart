class PlaceEntity {
  double? latitude;
  double ? longitude;
  String? city;

  PlaceEntity({
    this.latitude,
    this.longitude,
    this.city,
  });

  @override
  String toString() {
    return 'Place(Latitude: $latitude, Longitude: $longitude, city: $city)';
  }
}
