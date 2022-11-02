import 'package:get/get.dart';
import 'package:getx_vjezbanje/api/weather_api.dart';
import 'package:getx_vjezbanje/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WeatherApi());
    Get.lazyPut(() => HomeController());
  }
}
