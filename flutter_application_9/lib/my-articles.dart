import 'package:flutter/material.dart';
import 'package:flutter_application_9/api.dart';
import 'package:flutter_application_9/model/article.dart';
import 'package:flutter_application_9/my-article-detail.dart';

class MyArticles extends StatefulWidget {
  const MyArticles({super.key});

  @override
  State<MyArticles> createState() => _MyArticlesState();
}

class _MyArticlesState extends State<MyArticles> {
  late String searchKey;
  late String lang;
  late int pageSize;
  late int pageNumber;
  late Api api;
  late Future<List<Article>?> articles;

  @override
  void initState() {
    super.initState();
    searchKey = "code";
    lang = "en";
    pageSize = 5;
    pageNumber = 3;
    api = Api();
    articles = api.findArticlesBySearchKey(
      searchKey,
      lang,
      pageSize,
      pageNumber,
    );
  }

  refreshArticles() {
    setState(() {
      articles = api.findArticlesBySearchKey(
        searchKey,
        lang,
        pageSize,
        pageNumber,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: Articles()));
  }

  Widget Articles() {
    return Column(children: [Toolbar(), ArticlesContainer()]);
  }

  Widget Toolbar() {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        children: [
          ElevatedButton.icon(
            onPressed: () => {refreshArticles()},
            icon: Icon(Icons.refresh),
            label: Text("News", style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  Widget ArticlesContainer() {
    return FutureBuilder(
      future: articles,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }
          if (snapshot.data == null) {
            return Center(
              child: Text("Find article by search key unsuccessfull"),
            );
          }
          if (snapshot.data!.isEmpty) {
            return Center(child: Text("No articles exist"));
          }
          return ArticlesList(snapshot.data!);
        } else {
          return Expanded(child: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }

  Widget ArticlesList(List<Article> articles) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 500,
          crossAxisSpacing: 8,
          childAspectRatio: 2,
        ),
        itemCount: articles.length,
        itemBuilder: (context, index) => ArticleCart(articles[index]),
      ),
    );
  }

  Widget ArticleCart(Article article) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MyArticleDetail(article: article),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              // child: Image.network(
              //   "https://images.pexels.com/photos/1563356/pexels-photo-1563356.jpeg?cs=srgb&dl=pexels-thatguycraig000-1563356.jpg&fm=jpg",
              //   height: double.infinity,
              //   fit: BoxFit.cover,
              // ),
              child: Image.network(
                article.image,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                spacing: 4,
                children: [
                  Text(
                    article.title,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    article.content,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
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
