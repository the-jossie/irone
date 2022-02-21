import 'package:cloud_firestore/cloud_firestore.dart';

class ArticleDatabaseClass {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future getArticles() async {
    return await firebaseFirestore
        .collection("articles")
        .orderBy("timestamp", descending: true)
        .get();
  }

  Future bookmarkArticle(String id, bool bookmark) async {
    return await firebaseFirestore
        .collection("articles")
        .doc(id)
        .update({"bookmarked": bookmark});
  }
}
