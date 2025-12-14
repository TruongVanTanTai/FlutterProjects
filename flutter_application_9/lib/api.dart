import 'package:dio/dio.dart';
import 'package:flutter_application_9/model/article.dart';
import 'package:flutter_application_9/model/articles-response.dart';

class Api {
  String apiKey = "ca20c134e660fe938a824f5d50ed2ae2";

  Future<List<Article>?> findArticlesBySearchKey(
    String searchKey,
    String lang,
    int pageSize,
    int pageNumber,
  ) async {
    String url =
        "https://gnews.io/api/v4/search?q=${searchKey}&lang=${lang}&max=${pageSize}&page=${pageNumber}&apikey=${apiKey}";
    var dio = Dio();
    var response = await dio.request(url, options: Options(method: 'GET'));

    if (response.statusCode == 200) {
      ArticlesResponse articlesResponse = ArticlesResponse.fromJson(
        response.data as Map<String, dynamic>,
      );
      return articlesResponse.articles;
    } else {
      print(response.statusMessage);
      return null;
    }
  }
}
