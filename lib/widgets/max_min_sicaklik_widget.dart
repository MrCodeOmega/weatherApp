import 'package:flutter/material.dart';
import 'package:flutter_weather_app_pro/model/weather.dart';
import 'package:flutter_weather_app_pro/model/weather_view_model.dart';
import 'package:provider/provider.dart';

class MaxVeMinSicaklikWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _weatherViewModel = Provider.of<WeatherViewModel>(context);
    var bugununDegerleri =
        _weatherViewModel.getirilenWeather.consolidated_weather![0];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Maksimum : " + "${bugununDegerleri.max_temp!.toStringAsFixed(2)}",
          style: TextStyle(fontSize: 20),
        ),
        Text("Min : ${bugununDegerleri.min_temp!.toStringAsFixed(2)}",
            style: TextStyle(fontSize: 20)),
      ],
    );
  }
}
