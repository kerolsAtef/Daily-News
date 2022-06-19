import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_api/Controller/CategoryConroller.dart';
import 'package:news_api/Model/NewsModel.dart';

import '../Widgets/AppBar.dart';
import '../Widgets/CardVerticalList.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    String Data = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: AppBarText(t: Data),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blueGrey,
      ),
      body: FutureBuilder(
          future: CategoryController.getCategories(Data),
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
