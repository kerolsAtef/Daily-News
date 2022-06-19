class NewsModel {
  String title;
  String description;
  String urlToImage;
  String url;
  static String URLNOT =
      "https://cdn.vectorstock.com/i/1000x1000/85/43/error-page-not-found-vector-27898543.webp";

  NewsModel({
    required this.title,
    required this.description,
    required this.urlToImage,
    required this.url,
  });
  factory NewsModel.fromJson(List<dynamic> json, int index) {
    return NewsModel(
      title: json[index]['title'] == null
          ? "Title dose not Exist"
          : json[index]['title'],
      description: json[index]['description'] == null
          ? "description dose not Exist"
          : json[index]['description'],
      urlToImage: json[index]['urlToImage'] == null
          ? URLNOT
          : json[index]['urlToImage'],
      url: json[index]['url'] == null
          ? "link dose not Exist"
          : json[index]['url'],
    );
  }
}
