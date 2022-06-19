import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../Widgets/AppBar.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: AppBarText(t: "online news"),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white10,
        ),
        body: Container(
          color: Colors.white,
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Lottie.network(
                "https://assets9.lottiefiles.com/packages/lf20_2LdLki.json"),
          ),
        ));
  }
}
