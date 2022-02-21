import 'package:irone/widgets/molecules/bookmark_tile.dart';
import 'package:flutter/material.dart';

class BookmarkList extends StatelessWidget {
  final List bookmarksList;
  const BookmarkList({Key? key, required this.bookmarksList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: bookmarksList
          .map((article) => BookmarkTile(
                article: article,
              ))
          .toList(),
    );
  }
}
