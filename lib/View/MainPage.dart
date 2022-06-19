import 'package:flutter/material.dart';
import '../Lists/CatogreyNews.dart';
import 'package:news_api/Controller/NewsController.dart';
import 'package:news_api/Model/CateogryModel.dart';
import 'package:news_api/Model/NewsModel.dart';
import 'package:news_api/Widgets/AppBar.dart';
import '../Lists/CountryNews.dart';
import '../Model/CountryModel.dart';
import '../Widgets/CardHorizontalList.dart';
import '../Widgets/CardVerticalList.dart';
import '../Widgets/CircleList.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isVisible = true;
  List<CateogryModel> categories = [];
  List<Country> countries = [];

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    countries = getCountries();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isVisible = !isVisible;
              });
            },
            icon: Icon(Icons.keyboard_hide),
            color: Colors.blue,
          )
        ],
        title: AppBarText(t: "online news"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white10,
      ),
      body: SingleChildScrollView(
        child: Container(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                AnimatedContainer(
                  height: isVisible ? h * 0.2 : 0,
                  duration: Duration(milliseconds: 200),
                  child: ListView.builder(
                      itemCount: categories.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, int index) {
                        return CardHorizontalList(
                            t: categories[index].title,
                            w: w,
                            h: h,
                            url: categories[index].image_url);
                      }),
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: 400),
                  height: isVisible ? h * 0.12 : 0,
                  child: ListView.builder(
                      itemCount: countries.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, int index) {
                        return CircleList(
                            title: countries[index].title,
                            abb: countries[index].abbreviation,
                            w: w,
                            h: h,
                            image: countries[index].image);
                      }),
                ),
                FutureBuilder(
                    future: NewsController.getNews(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData == true) {
                        List<NewsModel> d = snapshot.data as List<NewsModel>;
                        return Container(
                          height: isVisible ? h * 0.50 : h * 0.80,
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
                        return Center(child: CircularProgressIndicator());
                      }
                    })
              ],
            )),
      ),
    );
  }
}
