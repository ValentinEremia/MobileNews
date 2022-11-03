//
import 'dart:convert';

import 'package:news_by_nny/model/article_model.dart';
import 'package:http/http.dart' as http;
import 'package:news_by_nny/util/colors.dart';

//  home page news:

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=56787255b2c14d47ab1c1fc7193dd9e6';

    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      jsonData['articles'].forEach(
        (element) {
          if (element['urlToImage'] != null && element['description'] != null) {
            ArticleModel articleModel = ArticleModel(
              urlToImage: element['urlToImage'],
              title: element['title'] ?? '',
              description: element['description'] ?? '',
              articleUrl: element['url'] ?? '',
              author: element['author'] ?? '',
              content: element['content'] ?? '',
            );

            news.add(articleModel);
            //asta aduce articolele in lista 'news' ,care este creata mai sus si initial este  goala.
          }
        },
      );
    }
  }
}

//  get category news:

class CategoryNewsClass {
  List<ArticleModel> news = [];

  Future<void> getNewsForCategory(String category) async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=56787255b2c14d47ab1c1fc7193dd9e6';

    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      jsonData['articles'].forEach(
        (element) {
          if (element['url'] != null && element['description'] != null) {
            ArticleModel articleModel = ArticleModel(
              urlToImage: element['urlToImage'] ?? notFound,
              title: element['title'] ?? '',
              description: element['description'] ?? '',
              articleUrl: element['url'] ?? '',
              author: element['author'] ?? '',
              content: element['content'] ?? '',
            );

            news.add(articleModel);
            //asta aduce articolele in lista 'news' ,care este creata mai sus si initial este  goala.
          }
        },
      );
    }
  }
}

//  get user search news:

class GetSearchNews {
  List<ArticleModel> news = [];

  Future<void> getNewsForSearch(userSearchText) async {
    String url =
        'https://newsapi.org/v2/everything?q=$userSearchText&sortBy=popularity&apiKey=56787255b2c14d47ab1c1fc7193dd9e6';

    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      jsonData['articles'].forEach(
        (element) {
          if (element['url'] != null && element['description'] != null) {
            ArticleModel articleModel = ArticleModel(
              urlToImage: element['urlToImage'] ?? notFound,
              title: element['title'] ?? '',
              description: element['description'] ?? '',
              articleUrl: element['url'] ?? '',
              author: element['author'] ?? '',
              content: element['content'] ?? '',
            );

            if (news.length <= 9) {
              news.add(articleModel);
            }

            //asta aduce articolele in lista 'news' ,care este creata mai sus si initial este  goala.
          }
        },
      );
    }
  }
}
