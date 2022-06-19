import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_api/View/MainPage.dart';

import 'View/start_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
        future: Future.delayed(Duration(seconds: 4)),
        builder: (context, timer) => timer.connectionState ==
                ConnectionState.done
            ? MainPage() //Screen to navigate to once the splashScreen is done.
            : StartPage(),
      ),
    );
  }
}
