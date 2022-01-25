import 'package:flutter_weather_app_pro/data/weather_api_client.dart';
import 'package:flutter_weather_app_pro/data/weather_repository.dart';
import 'package:flutter_weather_app_pro/model/weather_view_model.dart';
import "package:get_it/get_it.dart";

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => WeatherRepository());
  locator.registerLazySingleton(() => WeatherApiClient());
  locator.registerFactory(() => WeatherViewModel());
}
