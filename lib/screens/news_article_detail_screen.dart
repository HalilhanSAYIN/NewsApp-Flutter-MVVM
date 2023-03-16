import 'package:flutter/material.dart';
import 'package:news_app_provider_dio/utilities/style.dart';

import 'package:news_app_provider_dio/view_models/news_article_view_model.dart';
import 'package:news_app_provider_dio/widgets/image_widget.dart';

class NewsArticleDetailsScreen extends StatelessWidget {
  final NewsArticleViewModel article;
  const NewsArticleDetailsScreen(this.article, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            centerTitle: true,
            title: Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/author-default.png'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 150),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Author',
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                        Text(
                          article.author.toString(),
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 32.0, bottom: 16, left: 24, right: 24),
                child: Column(
                  children: [
                    Text(
                      article.title.toString(),
                      style: detailScreenTitleTextStyle,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 48, bottom: 48),
                      child: SizedBox(
                        height: 200,
                        child: ImageWidget(
                          imgUrl: article.imageUrl.toString(),
                        ),
                      ),
                    ),
                    Text(
                      article.description.toString(),
                      style: detailScreenDescriptionTextStyle,
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
