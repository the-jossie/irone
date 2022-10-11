import 'package:irone/models/article.dart';

class ArticleService {
  Future getArticles() async {
    return Articles().items;
  }
}
