import 'package:flutter/material.dart';

class LocationWidget extends StatelessWidget {
  final String? secilenSehir;
  LocationWidget({@required this.secilenSehir});
  @override
  Widget build(BuildContext context) {
    return Text(
      "$secilenSehir",
      style: TextStyle(
          fontSize: 21.0,
          fontWeight: FontWeight.w600,
          color: Colors.orangeAccent.shade200),
    );
  }
}
