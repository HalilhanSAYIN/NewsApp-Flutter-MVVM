import 'package:dio/dio.dart';
import 'package:news_app_provider_dio/models/news_article_model.dart';
import 'package:news_app_provider_dio/utilities/const.dart';

class NewsService {
  var dio = Dio();

  Future<List<NewsArticle>> fetchNewsByCategory(String category) async {
    final response = await dio.get(Const.topNewsbyCategory(category));

    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['articles'];
      return list.map((article) => NewsArticle.fromJson(article)).toList();
    } else {
      throw Exception();
    }
  }

  Future<List<NewsArticle>> fetchNews() async {
    final response = await dio.get(Const.topNews);

    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['articles'];
      return list.map((article) => NewsArticle.fromJson(article)).toList();
    } else {
      throw Exception();
    }
  }
}
