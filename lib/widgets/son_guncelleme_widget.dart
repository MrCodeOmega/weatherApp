import 'package:flutter/material.dart';
import 'package:flutter_weather_app_pro/model/weather_view_model.dart';
import 'package:provider/provider.dart';

class SonGuncellemeWidget extends StatelessWidget {
  const SonGuncellemeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _weatherViewModel = Provider.of<WeatherViewModel>(context);
    var yeniTarih = _weatherViewModel.getirilenWeather.time!.toLocal();
    return Text(
      "Son Güncelleme : " + TimeOfDay.fromDateTime(yeniTarih).format(context),
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}
