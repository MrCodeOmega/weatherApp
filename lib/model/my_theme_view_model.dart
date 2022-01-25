import 'package:flutter/material.dart';
import 'package:flutter_weather_app_pro/model/my_theme.dart';

class MyThemeViewModel with ChangeNotifier {
  MyTheme? _myTheme;
  MyThemeViewModel() {
    _myTheme = MyTheme(Colors.blue, ThemeData.light());
  }

  MyTheme get myTheme => _myTheme!;

  set myTheme(MyTheme value) {
    _myTheme = value;
    notifyListeners();
  }

  void temaDegistir(String havaDurumuKisaltmasi) {
    MyTheme? _geciciTema;
    switch (havaDurumuKisaltmasi) {
      case "sn": //karlı
      case "sl": //sulu kar
      case "h": //dolu
      case "t": //fırtına
      case "hc": //çok Bulutlu
        _geciciTema =
            MyTheme(Colors.grey, ThemeData(primaryColor: Colors.blueGrey));
        break;

      case "hr": //ağır yağmur
      case "lr": // hafif yağmur
      case "s": // sağanak
        _geciciTema = MyTheme(
            Colors.indigo, ThemeData(primaryColor: Colors.indigoAccent));
        break;
      case "lc": //az bulutlu
      case "c": //güneşli
        _geciciTema = MyTheme(Colors.orange,
            ThemeData(primaryColor: Colors.orangeAccent.shade200));
        break;
      default:
    }
    myTheme = _geciciTema!;
  }
}
