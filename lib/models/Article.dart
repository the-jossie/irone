import 'package:flutter/material.dart';

class Article with ChangeNotifier {
  final int id;
  final String title;
  final String imgPath;
  final String author;
  final String authorImg;
  final String timestamp;
  final String readTime;
  final String body;
  final int noOfLikes;
  final int noOfComments;

  Article({
    required this.id,
    required this.title,
    required this.imgPath,
    required this.author,
    required this.authorImg,
    required this.timestamp,
    required this.readTime,
    required this.body,
    required this.noOfLikes,
    required this.noOfComments,
  });
}

class Articles with ChangeNotifier {
  final List<Article> _items = [
    Article(
      id: 1,
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
    Article(
      id: 2,
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
    Article(
      id: 3,
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
  ];

  List<Article> get items {
    return [..._items];
  }
}
