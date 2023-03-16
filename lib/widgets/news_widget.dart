import 'package:flutter/material.dart';
import 'package:news_app_provider_dio/screens/news_article_detail_screen.dart';
import 'package:news_app_provider_dio/utilities/style.dart';
import 'package:news_app_provider_dio/view_models/news_article_view_model.dart';
import 'package:news_app_provider_dio/widgets/image_widget.dart';

class NewsGrid extends StatelessWidget {
  final List<NewsArticleViewModel> articles;
  const NewsGrid(this.articles, {Key? key}) : super(key: key);

  void _showNewsArticleDetails(context, article) {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return NewsArticleDetailsScreen(article);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (_, index) {
        var article = articles[index];
        return GestureDetector(
          onTap: () {
            _showNewsArticleDetails(context, article);
          },
          child: SizedBox(
            height: 150,
            width: 140,
            child: Card(
              color: Colors.black,
              shadowColor: Colors.white,
              elevation: 20,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: Row(
                children: [
                  Container(
                    height: 150,
                    width: 130,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    child: ImageWidget(
                      imgUrl: article.imageUrl.toString(),
                    ),
                  ),
                  Expanded(
                    child: Text(article.title.toString(),
                        style: newsScreenNewsTitleTextStyle,
                        overflow: TextOverflow.clip),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
