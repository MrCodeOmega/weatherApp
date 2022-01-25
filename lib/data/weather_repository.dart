import 'package:flutter_weather_app_pro/data/weather_api_client.dart';
import 'package:flutter_weather_app_pro/locator.dart';
import 'package:flutter_weather_app_pro/model/weather.dart';

class WeatherRepository {
  WeatherApiClient weatherApiClient = locator<WeatherApiClient>();
  Future<Weather?> getWeather(String sehir) async {
    final int? sehirID = await weatherApiClient.getLocationID(sehir);
    return await weatherApiClient.getWeather(sehirID!);
  }
}
