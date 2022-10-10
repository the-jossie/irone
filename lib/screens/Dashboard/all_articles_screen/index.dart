import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/models/article.dart';
import '/screens/dashboard/search_screen/index.dart';
import '/widgets/organisms/article_list.dart';

class AllArticlesScreen extends StatelessWidget {
  const AllArticlesScreen({Key? key}) : super(key: key);

  static const routeName = 'all-articles';
  @override
  Widget build(BuildContext context) {
    final articles = Provider.of<Articles>(context);
    final articlesList = articles.items;

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
        title: const Text("Top Articles"),
        centerTitle: false,
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        actions: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, SearchScreen.routeName),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xffF9F6F4),
                borderRadius: BorderRadius.circular(7),
              ),
              child: Icon(
                Icons.search_outlined,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
          const SizedBox(
            width: 23,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 23),
          child: Column(
            children: [
              const SizedBox(height: 30),
              ArticleList(
                articlesList: articlesList,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
