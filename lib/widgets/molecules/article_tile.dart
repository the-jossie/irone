import 'package:irone/models/article.dart';
import '../../views/dashboard/read_article.dart';
import 'package:flutter/material.dart';

class ArticleTile extends StatelessWidget {
  final Article article;
  const ArticleTile({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        ReadArticleScreen.routeName,
        arguments: ReadArticleScreenArguments(article: article),
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
                        article.author,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '• ${article.readTime}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 9,
                          color: Color(0x99393938),
                        ),
                      ),
                      Text(
                        ' • ${article.timestamp}',
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
                    article.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    article.body,
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
                  article.imgPath,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
