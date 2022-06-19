import 'package:flutter/material.dart';

class AppBarText extends StatelessWidget {
  String t;
  AppBarText({Key? key, required this.t}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      t,
      style: TextStyle(
          color: Colors.blueAccent, fontSize: 26, fontWeight: FontWeight.bold),
    );
  }
}
