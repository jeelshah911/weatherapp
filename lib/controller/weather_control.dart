import 'dart:developer';

import 'package:get/get.dart';
import 'package:weatherapp/data/services/caller.dart';
import 'package:weatherapp/models/weather.dart';

class WeatherController extends GetxController {
  var weather = WeatherModel().obs;

  void fetchWeather(String location, int day) async {
    try {
      var fetchedWeather =
          await NetworkCaller.getLocationWeather(location, day);
      weather.value = fetchedWeather;
    } catch (e) {
      log("Error fetching weather: $e");
    }
  }
}
