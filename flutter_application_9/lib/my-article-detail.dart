import 'package:flutter/material.dart';
import 'package:flutter_application_9/model/article.dart';

class MyArticleDetail extends StatefulWidget {
  final Article article;

  const MyArticleDetail({super.key, required this.article});

  @override
  State<MyArticleDetail> createState() => _MyArticleDetailState();
}

class _MyArticleDetailState extends State<MyArticleDetail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: ArticleDetail()));
  }

  Widget ArticleDetail() {
    return Column(children: [Toolbar(), ArticleContent()]);
  }

  Widget Toolbar() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(4),
      child: Row(
        children: [
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new),
            label: Text("Back", style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  Widget ArticleContent() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            Text(
              widget.article.title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Text(
                  widget.article.source.name,
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                SizedBox(width: 8),
                Text(
                  widget.article.publishedAt,
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            SizedBox(height: 8),
            //Text("Publish at: ${widget.article.publishedAt}"),
            Text(widget.article.description),
            SizedBox(height: 8),
            Image.network(widget.article.image),
            SizedBox(height: 8),
            Text(widget.article.content),
          ],
        ),
      ),
    );
  }
}
