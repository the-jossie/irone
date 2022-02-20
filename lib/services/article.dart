import 'package:cloud_firestore/cloud_firestore.dart';

class ArticleDatabaseClass {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future getArticles() async {
    return await firebaseFirestore
        .collection("articles")
        .orderBy("timestamp", descending: true)
        .get();
  }
}
