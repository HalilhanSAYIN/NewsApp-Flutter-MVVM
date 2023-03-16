import 'package:flutter/material.dart';
import 'package:news_app_provider_dio/models/news_article_model.dart';
import 'package:news_app_provider_dio/service/news_service.dart';
import 'package:news_app_provider_dio/view_models/news_article_view_model.dart';

enum LoadingStatus { completed, searching, empty }

class NewsArticleListViewModel with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.empty;
  List<NewsArticleViewModel> articles = <NewsArticleViewModel>[];
  void newsByCategory(String category) async {
    List<NewsArticle> newsArticles =
        await NewsService().fetchNewsByCategory(category);
    loadingStatus = LoadingStatus.searching;
    notifyListeners();
    articles = newsArticles
        .map((article) => NewsArticleViewModel(article: article))
        .toList();
    if (articles.isEmpty) {
      loadingStatus = LoadingStatus.empty;
    } else {
      loadingStatus = LoadingStatus.completed;
    }
    notifyListeners();
  }

  void topNews() async {
    List<NewsArticle> newsArticles = await NewsService().fetchNews();
    loadingStatus = LoadingStatus.searching;
    notifyListeners();
    articles = newsArticles
        .map((article) => NewsArticleViewModel(article: article))
        .toList();

    if (articles.isEmpty) {
      loadingStatus = LoadingStatus.empty;
    } else {
      loadingStatus = LoadingStatus.completed;
    }
    notifyListeners();
  }
}
