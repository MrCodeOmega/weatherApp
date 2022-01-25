import 'dart:convert';

class Weather {
  List<ConsolidatedWeather>? consolidated_weather;
  String? title;
  int? woeid;
  DateTime? time;

  Weather.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    woeid = json["woeid"];
    time = DateTime.parse(json["time"]);
    consolidated_weather = List<ConsolidatedWeather>.from(
        json["consolidated_weather"]
            .map((x) => ConsolidatedWeather.fromJson(x)));
  }
}

class ConsolidatedWeather {
  String? state_name;
  String? state_abbr;
  DateTime? applicable_date;
  double? min_temp;
  double? max_temp;
  double? the_temp;
  int? humidity;
  double? visibility;

  ConsolidatedWeather.fromJson(Map<String, dynamic> json) {
    state_name = json["weather_state_name"];
    state_abbr = json["weather_state_abbr"];
    applicable_date = DateTime.parse(json["applicable_date"]);
    min_temp = json["min_temp"];
    max_temp = json["max_temp"];
    the_temp = json["the_temp"];
    humidity = json["humidity"];
    visibility = json["visibility"];
  }
}
