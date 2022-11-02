class Location {
  String? country;
  String? regionName;
  double? lat;
  double? lon;

  Location([this.country, this.regionName]);

  Location.fromJson(dynamic json) {
    country = json['country'];
    regionName = json['regionName'];
    lat = json['lat'];
    lon = json['lon'];
  }
}
