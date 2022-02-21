import 'package:flutter/material.dart';
import 'package:irone/models/article.dart';
import 'package:irone/services/article.dart';
import 'package:provider/provider.dart';

class ArticleController {
  final ArticleDatabaseClass articleService = ArticleDatabaseClass();

  getAndPersistArticles(BuildContext context) async {
    final articlesList = Provider.of<Articles>(context, listen: false);

    articleService
        .getArticles()
        .then((data) => {
              articlesList.setArticles(
                data.docs.map(
                  (data) => Article.fromMap(
                    data.id,
                    data.data(),
                  ),
                ),
              ),
            })
        .catchError((onError) => {print(onError)});
  }

  updateAndPersistArticle(
      BuildContext context, String id, bool bookmark) async {
    final articlesList = Provider.of<Articles>(context, listen: false);

    articleService
        .bookmarkArticle(id, bookmark)
        .then((data) => {
              articlesList.bookmarkArticle(id, bookmark),
            })
        .catchError((onError) => {print(onError)});
  }
}
