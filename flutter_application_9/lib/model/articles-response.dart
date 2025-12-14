import 'package:flutter_application_9/model/article.dart';
import 'package:json_annotation/json_annotation.dart';

part 'articles-response.g.dart';

@JsonSerializable()
class ArticlesResponse {
  @JsonKey(name: "totalArticles")
  int totalArticles;

  @JsonKey(name: "articles")
  List<Article> articles;

  ArticlesResponse({required this.totalArticles, required this.articles});

  factory ArticlesResponse.fromJson(Map<String, dynamic> json) =>
      _$ArticlesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ArticlesResponseToJson(this);
}
