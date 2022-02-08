import 'package:irone/widgets/molecules/article_tile.dart';
import 'package:flutter/material.dart';

class ArticleList extends StatelessWidget {
  final List articlesList;
  const ArticleList({Key? key, required this.articlesList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: articlesList
          .map((article) => ArticleTile(
                article: article,
              ))
          .toList(),
    );
  }
}
