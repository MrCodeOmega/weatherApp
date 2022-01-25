import 'package:flutter/material.dart';
import 'package:flutter_weather_app_pro/model/weather_view_model.dart';
import 'package:provider/provider.dart';

class HavaDurumuResimWidget extends StatelessWidget {
  const HavaDurumuResimWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _weatherViewModel = Provider.of<WeatherViewModel>(context);
    var havaDurumuResim =
        _weatherViewModel.getirilenWeather.consolidated_weather![0];
    String? havaDurumuKisaltmasi = havaDurumuResim.state_abbr;

    return Column(children: [
      Text(
        "Sıcaklık :   " + havaDurumuResim.the_temp!.toStringAsFixed(2),
        style: TextStyle(
            fontSize: 31,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple),
      ),
      Divider(
        color: Colors.black,
        height: 10,
      ),
      Image.network(
        "https://www.metaweather.com/static/img/weather/" +
            "png/" +
            havaDurumuKisaltmasi! +
            ".png",
        fit: BoxFit.cover,
        width: 200,
        height: 200,
      ),
    ]);
  }
}
