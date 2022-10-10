import 'package:flutter/material.dart';

import '/models/bookmark.dart';
import '/screens/dashboard/read_article_screen/index.dart';

class BookmarkTile extends StatelessWidget {
  final Bookmark bookmark;
  const BookmarkTile({Key? key, required this.bookmark}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        ReadArticleScreen.routeName,
        arguments: ReadArticleScreenArguments(article: bookmark.article),
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color(0xffF9F6F4),
        ),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        bookmark.article.author,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '• ${bookmark.article.readTime}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 9,
                          color: Color(0x99393938),
                        ),
                      ),
                      Text(
                        ' • ${bookmark.article.timestamp}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 9,
                          color: Color(0x99393938),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    bookmark.article.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    bookmark.article.body,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 9,
                      color: Color(0x99393938),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 70,
              child: Image(
                image: AssetImage(
                  bookmark.article.imgPath,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
