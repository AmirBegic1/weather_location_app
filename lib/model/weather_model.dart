class WeatherModel {
  int? temp;

  WeatherModel({this.temp});

  WeatherModel.fromJson(dynamic json) {
    var tempInKelvin = json['main']['temp'];

    temp = (tempInKelvin - 273.15).round();
  }
}
