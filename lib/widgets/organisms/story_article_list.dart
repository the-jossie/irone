import 'package:irone/widgets/molecules/story_article_tile.dart';
import 'package:flutter/material.dart';

class StoryArticleList extends StatelessWidget {
  final List<dynamic> articlesList;
  const StoryArticleList({
    Key? key,
    required this.articlesList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: articlesList
            .map(
              (article) => StoryArticleTile(
                article: article,
              ),
            )
            .toList(),
      ),
    );
  }
}
