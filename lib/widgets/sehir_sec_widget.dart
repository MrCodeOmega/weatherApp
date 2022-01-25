import 'package:flutter/material.dart';
import 'package:flutter_weather_app_pro/model/my_theme_view_model.dart';
import 'package:flutter_weather_app_pro/model/weather_view_model.dart';
import 'package:provider/provider.dart';

class SehirSecWidget extends StatefulWidget {
  const SehirSecWidget({Key? key}) : super(key: key);

  @override
  _SehirSecWidgetState createState() => _SehirSecWidgetState();
}

class _SehirSecWidgetState extends State<SehirSecWidget> {
  final _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Şehir Seç"),
      ),
      body: Form(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: _textController,
                  decoration: InputDecoration(
                    labelText: "Şehir",
                    hintText: "Şehir Giriniz",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            IconButton(
                onPressed: () {
                  Navigator.pop(context, _textController.text);
                },
                icon: Icon(Icons.search))
          ],
        ),
      ),
    );
  }
}
