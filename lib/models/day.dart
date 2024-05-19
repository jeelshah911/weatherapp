import 'package:weatherapp/models/airquality.dart';
import 'package:weatherapp/models/condition.dart';

class Day {
  double? maxtempC;
  double? maxtempF;
  double? mintempC;
  double? mintempF;
  Condition? condition;
  double? uv;
  int? dailyChanceOfRain;
  AirQuality? airQuality;

  Day(
      {this.maxtempC,
      this.maxtempF,
      this.mintempC,
      this.mintempF,
      this.condition,
      this.uv,
      this.dailyChanceOfRain,
      this.airQuality});

  Day.fromJson(Map<String, dynamic> json) {
    maxtempC = json['maxtemp_c'];
    maxtempF = json['maxtemp_f'];
    mintempC = json['mintemp_c'];
    mintempF = json['mintemp_f'];
    condition = json['condition'] != null
        ? Condition.fromJson(json['condition'])
        : null;
    uv = json['uv'];
    dailyChanceOfRain = json['daily_chance_of_rain'];
    airQuality = json['air_quality'] != null
        ? AirQuality.fromJson(json['air_quality'])
        : null;
  }
}
