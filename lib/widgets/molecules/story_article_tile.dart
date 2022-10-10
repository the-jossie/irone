import 'package:flutter/material.dart';

import '/models/article.dart';
import '/screens/dashboard/read_article_screen/index.dart';

class StoryArticleTile extends StatelessWidget {
  final Article article;
  const StoryArticleTile({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        ReadArticleScreen.routeName,
        arguments: ReadArticleScreenArguments(article: article),
      ),
      child: Container(
        width: 249,
        margin: const EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color(0xffF9F6F4),
        ),
        child: Column(
          children: [
            Container(
              height: 114,
              decoration: const BoxDecoration(
                color: Color(0x0ff99441),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
              ),
              child: Center(
                child: Image(
                  image: AssetImage(article.imgPath),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 13),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 6),
                          width: 18,
                          height: 18,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Theme.of(context).primaryColor),
                            image: DecorationImage(
                              fit: BoxFit.contain,
                              image: AssetImage(
                                article.authorImg,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          article.author.length > 15
                              ? article.author.replaceRange(
                                  15, article.author.length, "...")
                              : article.author,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Theme.of(context).primaryColor),
                        ),
                        Text(
                          ' • ${article.readTime}',
                          style: const TextStyle(
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
                    const SizedBox(height: 5),
                    Text(
                      article.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 1),
                    Expanded(
                      child: Text(
                        article.body.length > 40
                            ? article.body
                                .replaceRange(40, article.body.length, "...")
                            : article.body,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 9,
                          color: Color(0x99393938),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Image(
                              image: AssetImage("assets/heart.png"),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              article.noOfLikes.toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 9,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '${article.noOfComments} comments',
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 9,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
