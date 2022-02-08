import 'package:irone/models/article.dart';
import 'package:irone/widgets/atoms/nav_tabs.dart';
import 'package:irone/widgets/organisms/article_list.dart';
import 'package:irone/widgets/organisms/story_article_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ArticlesScreen extends StatefulWidget {
  const ArticlesScreen({Key? key}) : super(key: key);

  @override
  _ArticlesScreenState createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  String activeTab = "Top Articles";

  setActiveTab(value) {
    setState(() {
      activeTab = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final articles = Provider.of<Articles>(context);
    final articlesList = articles.items;
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NavTabs(
              tabOptions: const ["Top Articles", "New Published", "All"],
              activeTab: activeTab,
              onClick: setActiveTab,
            ),
            const SizedBox(height: 14),
            SizedBox(
                height: 250,
                child: StoryArticleList(articlesList: articlesList)),
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Based on your health history",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Container(
                  width: 55,
                  height: 2,
                  color: Theme.of(context).primaryColor,
                ),
              ],
            ),
            const SizedBox(height: 15),
            ArticleList(
              articlesList: articlesList,
            ),
          ],
        ),
      ),
    );
  }
}
