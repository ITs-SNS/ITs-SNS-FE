import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'news.dart';

class NewsCard extends StatelessWidget {
  final News news;
  NewsCard({ required this.news });

  void launchChannel() async {
    if (await canLaunch(news.url)) {
      launch(news.url, forceWebView: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              news.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17.0,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 6.0),
            Text(
              news.contents,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(height: 8.0),
            Align(
              alignment: Alignment.centerRight,
              child: FlatButton.icon(
                onPressed: () {
                  launchChannel();
                },
                label: Text('see more'),
                icon: Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
    );
  }
}