import 'package:irone/models/article.dart';
import 'package:flutter/material.dart';

class Bookmark {
  final Article article;

  Bookmark({required this.article});
}

class Bookmarks with ChangeNotifier {
  final Map<String, Bookmark> _items = {
    "4": Bookmark(
      article: Article(
        id: "4",
        title: "How Sunlight, the Immune System, and Covid-19 Interact",
        body:
            "For thousands of years, humans have recognized that the sun plays a role in the emergence and transmission of viruses",
        imgPath: "assets/articles/article-1.png",
        author: "Markham Heid",
        authorImg: "assets/available-doctors/doctor-2.png",
        readTime: "10 min read",
        timestamp: "20 Nov",
        noOfLikes: 100,
        noOfComments: 45,
      ),
    ),
    "5": Bookmark(
      article: Article(
        id: "5",
        title: "The Science Behind Improving Your Immune System",
        body:
            "Today i will talk about that science about your immune system that nobody ever talk about",
        imgPath: "assets/articles/article-2.png",
        author: "Dr. Christine Bradstreet",
        authorImg: "assets/available-doctors/doctor-2.png",
        readTime: "7 min read",
        timestamp: "20 Nov",
        noOfLikes: 100,
        noOfComments: 45,
      ),
    ),
    "6": Bookmark(
      article: Article(
        id: "6",
        title: "6 Habits of Highly Healthy Brains",
        body: "Key lifestyle habits that can help keep your brain healthy.",
        imgPath: "assets/articles/article-1.png",
        author: "Thomas Oppong",
        authorImg: "assets/available-doctors/doctor-2.png",
        readTime: "5 min read",
        timestamp: "20 Nov",
        noOfLikes: 100,
        noOfComments: 45,
      ),
    ),
  };

  Map<String, Bookmark> get items {
    return {..._items};
  }

  void addItem(Article article) {
    if (_items.containsKey(article.id)) {
      _items.remove(article.id);
    } else {
      _items.putIfAbsent(
        article.id,
        () => Bookmark(article: article),
      );
    }
    notifyListeners();
  }
}

// Random().nextInt(900000) + 100000