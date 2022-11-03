import 'package:flutter/material.dart';
import 'package:news_by_nny/util/colors.dart';
import 'package:news_by_nny/views/home.dart';
import '../helper/news.dart';
import '../model/article_model.dart';

//

class SearchPage extends StatefulWidget {
  //

  const SearchPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
//
  List<ArticleModel> articles = List.empty(growable: true);
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getNewsForSearch(userSearchText);
  }

  getNewsForSearch(String userSearchText) async {
    GetSearchNews newsClass = GetSearchNews();
    await newsClass.getNewsForSearch(userSearchText);
    articles = newsClass.news;

    setState(() {
      _loading = false;
    });
  }

  // // controler for text field:
  static final TextEditingController _controller = TextEditingController();
  // store user search text into a variable:
  var userSearchText = '';
  void submitSearch(text) {
    setState(
      () {
        userSearchText = _controller.text;
        getNewsForSearch(_controller.text);
        _controller.clear();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    //

    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryColor,
        iconTheme: const IconThemeData(color: textColor),
        title: TextField(
          controller: _controller,
          style: const TextStyle(color: textBlueColor),
          decoration: InputDecoration(
            hintText: 'Search Article...',
            hintStyle: const TextStyle(color: textHintColor),
            border: InputBorder.none,
            suffixIcon: IconButton(
              onPressed: () {
                if (_controller.text != '') {
                  _controller.clear();
                } else {
                  Navigator.of(context).pop(
                    MaterialPageRoute(
                      builder: (context) => const Home(),
                    ),
                  );
                }
              },
              icon: const Icon(
                Icons.close,
                color: Colors.redAccent,
              ),
            ),
          ),
          onSubmitted: (text) {
            submitSearch(_controller.text);
          },
        ),
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
