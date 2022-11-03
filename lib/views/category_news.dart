// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:news_by_nny/helper/news.dart';
import 'package:news_by_nny/model/article_model.dart';
import '../views/home.dart';
import '../helper/news.dart';
import '../util/colors.dart';

class CategoryNews extends StatefulWidget {
  final String category;

  const CategoryNews({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<ArticleModel> articles = List.empty(growable: true);
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getCategoryNews();
  }

  getCategoryNews() async {
    CategoryNewsClass newsClass = CategoryNewsClass();
    await newsClass.getNewsForCategory(widget.category);
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.category,
          style: const TextStyle(
              color: textBlueColor, fontWeight: FontWeight.w600),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 8, right: 16),
            child: Column(
              children: const [
                Icon(
                  Icons.android,
                  color: shadowColor,
                  size: 25,
                ),
                Text(
                  'byNNY',
                  style: TextStyle(
                      color: shadowColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 12),
                ),
              ],
            ),
          )
        ],
        iconTheme: const IconThemeData(color: textColor),
        backgroundColor: primaryColor,
        elevation: 0.0,
      ),
      body: _loading
          ? Center(
              child: Container(
                child: const CircularProgressIndicator(
                  color: textBlueColor,
                ),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    //    NEWS ARTICLE CARDS   //

                    Container(
                      margin: const EdgeInsets.only(top: 16),
                      child: ListView.builder(
                          physics: const ClampingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: articles.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return NewsTile(
                              imageArticleUrl: articles[index].urlToImage,
                              titleArticle: articles[index].title,
                              descriptionArticle: articles[index].description,
                              articleUrl: articles[index].articleUrl,
                            );
                          }),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
