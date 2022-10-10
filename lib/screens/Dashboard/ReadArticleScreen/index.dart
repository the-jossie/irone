import 'package:irone/models/Article.dart';
import 'package:irone/models/Bookmark.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReadArticleScreenArguments {
  final Article article;

  ReadArticleScreenArguments({required this.article});
}

class ReadArticleScreen extends StatelessWidget {
  ReadArticleScreen({Key? key}) : super(key: key);
  static const routeName = 'read-article';
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments
        as ReadArticleScreenArguments;
    final bookmarks = Provider.of<Bookmarks>(context);
    final bookmarksList = bookmarks.items;

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
        actions: [
          GestureDetector(
            onTap: () => {},
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xffF9F6F4),
                borderRadius: BorderRadius.circular(7),
              ),
              child: const Icon(
                Icons.share_outlined,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(
            width: 9,
          ),
          GestureDetector(
            onTap: () => bookmarks.addItem(args.article),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xffF9F6F4),
                borderRadius: BorderRadius.circular(7),
              ),
              child: bookmarksList.containsKey(args.article.id)
                  ? Icon(
                      Icons.bookmark,
                      color: Theme.of(context).primaryColor,
                    )
                  : const Icon(
                      Icons.bookmark_outline,
                      color: Colors.black,
                    ),
            ),
          ),
          const SizedBox(
            width: 23,
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 23),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                      child: Image(
                        height: 243,
                        width: 241,
                        image: AssetImage(args.article.imgPath),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Row(
                      children: [
                        Row(
                          children: [
                            const Image(
                              image: AssetImage("assets/heart.png"),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              args.article.noOfLikes.toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 9,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 10),
                        Text(
                          '${args.article.noOfComments} comments',
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 9,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 21),
                    Text(
                      args.article.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 6),
                          width: 28,
                          height: 26,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Theme.of(context).primaryColor),
                            image: DecorationImage(
                              fit: BoxFit.contain,
                              image: AssetImage(
                                args.article.authorImg,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          args.article.author,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Theme.of(context).primaryColor),
                        ),
                        Text(
                          ' • ${args.article.readTime}',
                          style: const TextStyle(
                            fontSize: 9,
                            color: Color(0x99393938),
                          ),
                        ),
                        Text(
                          ' • ${args.article.timestamp}',
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 9,
                            color: Color(0x99393938),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    Text(
                      args.article.body,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 9, top: 16, bottom: 34),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => {},
                    icon: Icon(
                      Icons.emoji_emotions_outlined,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: const Color(0xfff9f6f4),
                          borderRadius: BorderRadius.circular(12)),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Write a comment",
                          border: InputBorder.none,
                        ),
                        controller: textController,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                        color: const Color(0xfff9f6f4),
                        borderRadius: BorderRadius.circular(12)),
                    child: Icon(
                      Icons.send_outlined,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
