import 'package:irone/models/article.dart';
import 'package:irone/widgets/organisms/bookmarks_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookmarksScreen extends StatelessWidget {
  const BookmarksScreen({Key? key}) : super(key: key);
  static const routeName = 'bookmarks';

  @override
  Widget build(BuildContext context) {
    dynamic bookmarksList = Provider.of<Articles>(context);

    bookmarksList.items.retainWhere((element) => element.bookmarked);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xffF9F6F4),
              borderRadius: BorderRadius.circular(7),
            ),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        title: const Text("Bookmarks"),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 23),
          child: BookmarkList(
            bookmarksList: bookmarksList.values.toList(),
          ),
        ),
      ),
    );
  }
}
