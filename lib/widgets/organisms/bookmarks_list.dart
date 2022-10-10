import 'package:flutter/material.dart';

import '/widgets/molecules/bookmark_tile.dart';

class BookmarkList extends StatelessWidget {
  final List bookmarksList;
  const BookmarkList({Key? key, required this.bookmarksList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: bookmarksList
          .map((article) => BookmarkTile(
                bookmark: article,
              ))
          .toList(),
    );
  }
}
