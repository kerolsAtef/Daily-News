import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_api/Controller/CountryController.dart';
import '../Model/NewsModel.dart';
import '../Widgets/AppBar.dart';
import '../Widgets/CardVerticalList.dart';

class CountryNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    String Data = Get.arguments[1];
    String abb = Get.arguments[0];
    print(abb);
    return Scaffold(
      appBar: AppBar(
        title: AppBarText(t: Data),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blueGrey,
      ),
      body: FutureBuilder(
          future: CountryController.getCountries(abb),
          builder: (context, snapshot) {
            if (snapshot.hasData == true) {
              List<NewsModel> d = snapshot.data as List<NewsModel>;
              return Container(
                height: h,
                child: ListView.builder(
                  itemCount: d.length,
                  itemBuilder: (context, int i) {
                    return CardVerticalList(
                        title: d[i].title,
                        desc: d[i].description,
                        imageToUrl: d[i].urlToImage,
                        w: w,
                        h: h);
                  },
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
