import 'package:flutter/material.dart';
import 'package:flutter_weather_app_pro/locator.dart';
import 'package:flutter_weather_app_pro/model/my_theme_view_model.dart';
import 'package:flutter_weather_app_pro/model/weather_view_model.dart';
import 'widgets/weather_home_page.dart';
import 'package:provider/provider.dart';

void main() {
  setupLocator();
  runApp(ChangeNotifierProvider(
      create: (context) => MyThemeViewModel(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, MyThemeViewModel myThemeViewModel, child) =>
          MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: myThemeViewModel.myTheme.tema,
        home: ChangeNotifierProvider<WeatherViewModel>(
            create: (context) => locator<WeatherViewModel>(),
            child: WeatherApp()),
      ),
    );
  }
}
