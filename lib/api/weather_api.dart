import 'package:get/get.dart';
import 'package:getx_vjezbanje/model/location_model.dart';
import 'package:getx_vjezbanje/model/weather_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'dart:convert' as convert;

class WeatherApi {
  final apiKey = "6f88c1c479804ced1f9a54a1890e5e7b";

  Future<Location?> getCurrentLocation() async {
    Location? location;

    var url = Uri.http('ip-api.com', '/json');

    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      location = Location.fromJson(jsonResponse);
      print('Uspjesno odradjen api: $jsonResponse');
      return location;
    } else {
      print('Greska s apijem: ${response.statusCode}');
      return location;
    }
  }

  Future<WeatherModel?> getWeatherForLocation(Location location) async {
    WeatherModel? weather;

    var params = {
      'lat': location.lat.toString(),
      'lon': location.lon.toString(),
      'city': location.regionName,
      'appId': apiKey,
    };

    var url = Uri.http('api.openweathermap.org', '/data/2.5/weather', params);
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      weather = WeatherModel.fromJson(jsonResponse);
      print('Uspjesno vrijeme: $jsonResponse');
      return weather;
    } else {
      print('Greska sa vremenom: ${response.statusCode}.');
      return weather;
    }
  }
}
