import 'package:news_app_provider_dio/models/news_article_model.dart';

class NewsArticleViewModel {
  final NewsArticle _newsArticle;
  NewsArticleViewModel({required NewsArticle article}) : _newsArticle = article;

  String? get title {
    return _newsArticle.title;
  }

  String? get author {
    return _newsArticle.author;
  }

  String? get url {
    return _newsArticle.url;
  }

  String? get imageUrl {
    return _newsArticle.urlToImage;
  }

  String? get description {
    return _newsArticle.description;
  }

  String? get content {
    return _newsArticle.content;
  }

  String? get publishedAt {
    return _newsArticle.publishedAt;
  }
}
