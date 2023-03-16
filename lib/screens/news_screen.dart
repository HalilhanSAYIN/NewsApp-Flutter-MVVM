import 'package:flutter/material.dart';
import 'package:news_app_provider_dio/utilities/const.dart';
import 'package:news_app_provider_dio/view_models/news_article_list_view_model.dart';
import 'package:news_app_provider_dio/widgets/news_widget.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<NewsArticleListViewModel>(context, listen: false).topNews();
  }

  @override
  Widget build(BuildContext context) {
    var listViewModel = Provider.of<NewsArticleListViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'News',
          style: TextStyle(fontSize: 50, color: Colors.white),
        ),
        actions: [
          PopupMenuButton(
            color: Colors.black,
            shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(24)),
            onSelected: (value) {
              listViewModel.newsByCategory(Const.categories[value]!);
            },
            icon: const Icon(
              Icons.category,
              color: Colors.white,
            ),
            itemBuilder: (_) {
              return Const.categories.keys
                  .map((v) => PopupMenuItem(
                        value: v,
                        child: Text(v),
                        textStyle: const TextStyle(color: Colors.white),
                      ))
                  .toList();
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Expanded(child: NewsGrid(listViewModel.articles))],
        ),
      ),
    );
  }
}
