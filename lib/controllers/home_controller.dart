import 'package:get/get.dart';
import 'package:getx_vjezbanje/api/weather_api.dart';
import 'package:getx_vjezbanje/model/location_model.dart';
import 'package:getx_vjezbanje/model/weather_model.dart';

class HomeController extends GetxController {
  final WeatherApi _api = Get.find();

  Rxn<Location> locationData = Rxn();
  Rxn<WeatherModel> weatherData = Rxn();

  String get adress =>
      "${locationData.value?.regionName}, ${locationData.value?.country}";

  String get temperature => "${weatherData.value?.temp}";
  RxString infoText = '...'.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    await getCurrentLocation();
    await getTemperatureForCurrentLocation();
  }

  getCurrentLocation() async {
    Location? location = await _api.getCurrentLocation();
    print(location?.regionName);
    locationData.value = location;
  }

  getTemperatureForCurrentLocation() async {
    if (locationData.value != null) {
      weatherData.value = await _api.getWeatherForLocation(locationData.value!);
      getInfo(weatherData.value?.temp);
    }
  }

  getInfo(int? temperature) {
    if (temperature == null) {
      infoText.value = "nepoznato!";
    } else if (temperature <= 0) {
      infoText.value = "Preporučeno slojevito oblačenje! Veoma je hladno vani!";
    } else if (temperature <= 15) {
      infoText.value = "Prepoučeno nošenje jakne, nemojte se prehladiti :)";
    } else {
      infoText.value = "Uzivajte u lijepom vremenu! ;)";
    }
  }
}
