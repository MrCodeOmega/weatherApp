import 'package:flutter/material.dart';
import 'package:flutter_weather_app_pro/data/weather_repository.dart';
import 'package:flutter_weather_app_pro/locator.dart';
import 'package:flutter_weather_app_pro/model/weather.dart';

enum WeatherState {
  InitialWeatherState,
  WeatherLoadingState,
  WeatherLoadedState,
  WeatherErrorState
}

class WeatherViewModel with ChangeNotifier {
  WeatherState? _state;
  WeatherRepository? _repository = locator<WeatherRepository>();
  Weather? _getirilenWeather;

  WeatherViewModel() {
    _state = WeatherState.InitialWeatherState;
  }

  WeatherState get state => _state!;

  set state(WeatherState value) {
    _state = value;
    notifyListeners();
  }

  Weather get getirilenWeather => _getirilenWeather!;

  Future<Weather?> havaDurumunuGetir(String sehirAdi) async {
    try {
      state = WeatherState.WeatherLoadingState;
      _getirilenWeather = await _repository!.getWeather(sehirAdi);
      state = WeatherState.WeatherLoadedState;
    } catch (e) {
      state = WeatherState.WeatherErrorState;
      debugPrint("$e");
    }
    return _getirilenWeather;
  }

  Future<Weather?> havaDurumunuGuncelle(String sehirAdi) async {
    try {
      _getirilenWeather = await _repository!.getWeather(sehirAdi);
      state = WeatherState.WeatherLoadedState;
    } catch (e) {
      debugPrint("$e");
    }
    return _getirilenWeather;
  }

  String? havaDurumuKisaltmasi() {
    return _getirilenWeather!.consolidated_weather![0].state_abbr;
  }
}
