import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_weather_app_pro/model/my_theme_view_model.dart';
import 'package:flutter_weather_app_pro/model/weather_view_model.dart';
import 'package:flutter_weather_app_pro/widgets/sehir_sec_widget.dart';
import 'package:provider/provider.dart';
import 'hava_durumu_resim_widget.dart';
import 'location_widget.dart';
import 'max_min_sicaklik_widget.dart';
import 'son_guncelleme_widget.dart';

WeatherViewModel? _weatherViewModel = WeatherViewModel();
MyThemeViewModel? _myThemeViewModel;
String kullanicininSectigiSehir = "Çanakkale";
String? havaDurumuKisaltma;

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _weatherViewModel = Provider.of<WeatherViewModel>(context);
    _myThemeViewModel = Provider.of<MyThemeViewModel>(context);
    return Scaffold(
      //  backgroundColor: _myThemeViewModel!.myTheme.renk,
      floatingActionButton: FloatingActionButton(
        onPressed: () => null,
        child: Icon(Icons.book),
      ),
      appBar: AppBar(
        backgroundColor: _myThemeViewModel!.myTheme.renk,
        title: Text("Weather App Pro"),
        actions: [
          IconButton(
              onPressed: () async {
                kullanicininSectigiSehir = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SehirSecWidget()));
                _weatherViewModel.havaDurumunuGetir(kullanicininSectigiSehir);
              },
              icon: Icon(Icons.search)),
        ],
      ),
      body: Center(
        child: (_weatherViewModel.state == WeatherState.WeatherLoadedState)
            ? havaDurumuGeldi(context)
            : (_weatherViewModel.state == WeatherState.WeatherLoadingState)
                ? havaDurumuGetiriliyor()
                : (_weatherViewModel.state == WeatherState.WeatherErrorState)
                    ? havaDurumuHata()
                    : Text("Lütfen Şehir Seçin..."),
      ),
    );
  }

  havaDurumuGetiriliyor() {
    return CircularProgressIndicator();
  }

  havaDurumuHata() {
    Text("Hava Durumu Getirilirken Hata !!");
  }
}

Widget? havaDurumuGeldi(BuildContext context) {
  _weatherViewModel!.havaDurumunuGuncelle(kullanicininSectigiSehir);
  var havaDurumuKisaltmasi =
      _weatherViewModel!.getirilenWeather.consolidated_weather;

  return ListView(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: LocationWidget(
          secilenSehir: kullanicininSectigiSehir,
        )),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(child: SonGuncellemeWidget()),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(child: HavaDurumuResimWidget()),
      ),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(child: MaxVeMinSicaklikWidget()),
      ),
      Divider(
        height: 5,
      ),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            InkWell(
              onTap: () {},
              child: Card(
                elevation: 8,
                shadowColor: Colors.black,
                child: Container(
                  height: 150,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: LinearGradient(
                        colors: [Colors.red, Colors.blue.shade400],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter),
                  ),
                  child: Column(
                    children: [
                      Image.network(
                        "https://www.metaweather.com/static/img/weather/" +
                            "png/" +
                            havaDurumuKisaltmasi![1].state_abbr! +
                            ".png",
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 8),
                      Text("Temp : " +
                          havaDurumuKisaltmasi[1].the_temp!.toStringAsFixed(2)),
                      Text("Day : " +
                          havaDurumuKisaltmasi[1]
                              .applicable_date!
                              .day
                              .toString()),
                    ],
                  ),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(8)),
            Card(
              elevation: 8,
              shadowColor: Colors.black,
              child: Container(
                height: 150,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: LinearGradient(
                      colors: [Colors.red, Colors.blue.shade400],
                      begin: Alignment.topRight,
                      end: Alignment.center),
                ),
                child: Column(
                  children: [
                    Image.network(
                      "https://www.metaweather.com/static/img/weather/" +
                          "png/" +
                          havaDurumuKisaltmasi[2].state_abbr! +
                          ".png",
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 8),
                    Text("Temp : " +
                        havaDurumuKisaltmasi[2].the_temp!.toStringAsFixed(2)),
                    Text("Day : " +
                        havaDurumuKisaltmasi[2]
                            .applicable_date!
                            .day
                            .toString()),
                  ],
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(8)),
            Card(
              elevation: 8,
              shadowColor: Colors.black,
              child: Container(
                height: 150,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: LinearGradient(
                      colors: [Colors.white, Colors.blue.shade400],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter),
                ),
                child: Column(
                  children: [
                    Image.network(
                      "https://www.metaweather.com/static/img/weather/" +
                          "png/" +
                          havaDurumuKisaltmasi[3].state_abbr! +
                          ".png",
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 8),
                    Text("Temp : " +
                        havaDurumuKisaltmasi[3].the_temp!.toStringAsFixed(2)),
                    Text("Day : " +
                        havaDurumuKisaltmasi[3]
                            .applicable_date!
                            .day
                            .toString()),
                  ],
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(8)),
            Card(
              elevation: 8,
              shadowColor: Colors.black,
              child: Container(
                height: 150,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: LinearGradient(
                      colors: [Colors.white, Colors.blue.shade400],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter),
                ),
                child: Column(
                  children: [
                    Image.network(
                      "https://www.metaweather.com/static/img/weather/" +
                          "png/" +
                          havaDurumuKisaltmasi[4].state_abbr! +
                          ".png",
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 8),
                    Text("Temp : " +
                        havaDurumuKisaltmasi[4].the_temp!.toStringAsFixed(2)),
                    Text("Day : " +
                        havaDurumuKisaltmasi[4]
                            .applicable_date!
                            .day
                            .toString()),
                  ],
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(8)),
          ],
        ),
      ),
    ],
  );
}
