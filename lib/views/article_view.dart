// ignore_for_file: avoid_unnecessary_containers

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../util/colors.dart';

class ArticleView extends StatefulWidget {
  final String urlToArticle;

  const ArticleView({Key? key, required this.urlToArticle}) : super(key: key);

  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              "Mobile",
              style: TextStyle(color: textColor, fontWeight: FontWeight.w600),
            ),
            Text(
              "News",
              style:
                  TextStyle(color: textBlueColor, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
          ],
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
      body: Container(
        child: WebView(
          initialUrl: widget.urlToArticle,
          onWebViewCreated: ((WebViewController webViewController) {
            _completer.complete(webViewController);
          }),
        ),
      ),
    );
  }
}
