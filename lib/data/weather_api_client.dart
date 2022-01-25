import 'dart:convert';

import 'package:flutter_weather_app_pro/model/weather.dart';
import 'package:http/http.dart' as http;

class WeatherApiClient {
  static const baseUrl = "https://www.metaweather.com";
  final http.Client httpClient = http.Client();

  Future<int?> getLocationID(String sehirAdi) async {
    final sehirUrl = "$baseUrl/api/location/search/?query=" + sehirAdi;
    final gelenCevap = await httpClient.get(Uri.parse(sehirUrl));
    if (gelenCevap.statusCode != 200) {
      throw Exception("Veri Getirelemedi");
    }
    final gelenCevapJson = (jsonDecode(gelenCevap.body)) as List;
    return gelenCevapJson[0]["woeid"];
  }

  Future<Weather?> getWeather(int sehirID) async {
    final havaDurumuURL = baseUrl + "/api/location/$sehirID";
    final havaDurumuGelenCevap = await httpClient.get(Uri.parse(havaDurumuURL));
    if (havaDurumuGelenCevap.statusCode != 200) {
      throw Exception("Hava durumu bilgisi Hata");
    }
    final havaDurumuGelenCevapJson = jsonDecode(havaDurumuGelenCevap.body);
    return Weather.fromJson(havaDurumuGelenCevapJson);
  }
}
