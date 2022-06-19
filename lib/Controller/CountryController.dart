import 'dart:convert';
import 'package:news_api/Model/NewsModel.dart';
import 'package:http/http.dart' as http;

class CountryController {
  static Future<List<NewsModel>> getCountries(String country) async {
    List<NewsModel> l = <NewsModel>[];
    Uri uri = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=$country&apiKey=b47c5e837e464b69b993eb7316857461");
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      var returnedNews = jsonDecode(response.body);

      for (int x = 0; x < returnedNews['articles'].length; x++) {
        var i = NewsModel.fromJson(returnedNews['articles'], x);
        NewsModel n = NewsModel(
            title: i.title,
            description: i.description,
            urlToImage: i.urlToImage,
            url: i.url);
        l.add(n);
      }
      return l;
    } else
      throw Exception('Failed to load news');
  }
}
