// ignore_for_file: avoid_unnecessary_containers, avoid_print, sized_box_for_whitespace

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_by_nny/views/article_view.dart';
import 'package:news_by_nny/views/category_news.dart';
import '../helper/data.dart';
import '../helper/news.dart';
import 'package:news_by_nny/model/article_model.dart';
import 'package:news_by_nny/model/category_model.dart';
import '../util/colors.dart';
import 'search_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //

  List<CategoryModel> category = [];
  //

  //
  List<ArticleModel> articles = List.empty(growable: true);
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    category = getCategories();

    getNews();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            SizedBox(
              width: 45,
            ),
            Text(
              "Mobile",
              style: TextStyle(color: textColor, fontWeight: FontWeight.w600),
            ),
            Text(
              "News",
              style:
                  TextStyle(color: textBlueColor, fontWeight: FontWeight.w600),
            ),
          ],
        ),

        //
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 8, right: 16),
            child: IconButton(
              icon: const Icon(
                Icons.search,
                color: textColor,
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SearchPage(),
                  ),
                );
              },
            ),

            // child: Column(
            //   children: const [
            //     Icon(
            //       Icons.android,
            //       color: shadowColor,
            //       size: 25,
            //     ),
            //     Text(
            //       'byNNY',
            //       style: TextStyle(
            //           color: shadowColor,
            //           fontWeight: FontWeight.w500,
            //           fontSize: 12),
            //     ),
            //   ],
            // ),
          ),
        ],
        backgroundColor: primaryColor,
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          _loading
              ? Center(
                  child: Container(
                    child: const CircularProgressIndicator(
                      color: textBlueColor,
                    ),
                  ),
                )
              : Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        //

                        //   CATEGORY //

                        Container(
                          height: 70,
                          child: ListView.builder(
                            itemCount: category.length,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return CategoryTile(
                                imageUrl: category[index].imageUrl,
                                categoryName: category[index].categoryName,
                              );
                            },
                          ),
                        ),

                        //
                        //    NEWS ARTICLE CARDS   //

                        Container(
                          margin: const EdgeInsets.only(top: 5),
                          child: ListView.builder(
                              physics: const ClampingScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemCount: articles.length,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                return NewsTile(
                                  imageArticleUrl: articles[index].urlToImage,
                                  titleArticle: articles[index].title,
                                  descriptionArticle:
                                      articles[index].description,
                                  articleUrl: articles[index].articleUrl,
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}

//
//
//

class CategoryTile extends StatelessWidget {
  //

  // ignore: prefer_typing_uninitialized_variables
  final imageUrl, categoryName;
  const CategoryTile({Key? key, this.imageUrl, this.categoryName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryNews(
              category: categoryName,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.only(right: 7),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(7),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                width: 122,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: 120,
              height: 60,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(7),
              ),
              child: Text(
                categoryName,
                style: const TextStyle(
                  color: textWhiteColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

//

//

class NewsTile extends StatelessWidget {
  final String imageArticleUrl, titleArticle, descriptionArticle, articleUrl;

  const NewsTile({
    Key? key,
    required this.imageArticleUrl,
    required this.titleArticle,
    required this.descriptionArticle,
    required this.articleUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleView(urlToArticle: articleUrl),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(7),
              child: Image.network(imageArticleUrl),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              titleArticle,
              style: const TextStyle(
                  color: textColor, fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              descriptionArticle,
              style: const TextStyle(
                color: textLightColor,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
