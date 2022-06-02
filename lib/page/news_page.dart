import 'package:flutter/material.dart';
import '../news.dart';
import '../news_card.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../server.dart';

class NewsPage extends StatefulWidget {
  String? keyword = null;

  NewsPage({required this.keyword});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  int page = 0;
  List<News> newsList = List.empty(growable: true);
  bool isLoading = false;

  Future _loadData() async {
    await Future.delayed(Duration(seconds: 2));
    print("load more");
    setState(() {
      fetchNews(widget.keyword);
      isLoading = false;
    });
  }

  void fetchNews(String? keyword) async {
    String url = address + "news_list?page=" + page.toString();
    if (keyword != null) {
      url += "&keyword=" + keyword;
    }
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(utf8.decode(response.bodyBytes));
      List<dynamic> tmpList = json['newsList'];
      List<News> newsListDTO = List.empty(growable: true);
      for (int i = 0; i < tmpList.length; i++) {
        List<dynamic> keywordJsonList = tmpList[i]['newsKeywordList'];
        List<String> keywordList = List.empty(growable: true);

        for (int j = 0; j < keywordJsonList.length; j++) {
          keywordList.add(keywordJsonList[j]['keywordContent']);
        }

        newsListDTO.add(News(
          title: tmpList[i]['newsTitle'],
          contents: tmpList[i]['newsSummary'],
          url: tmpList[i]['newsUrl'],
          keywords: keywordList,
        ));
      }
      setState(() {
        newsList.addAll(newsListDTO);
        page++;
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  void setupPage() async {

  }

  @override
  void initState() {
    super.initState();
    fetchNews(widget.keyword);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollInfo) {
                if (!isLoading &&
                    scrollInfo.metrics.pixels ==
                        scrollInfo.metrics.maxScrollExtent) {
                  _loadData();
                  // start loading data
                  setState(() {
                    isLoading = true;
                  });
                }
                return true;
              },
              child: ListView.builder(
                itemCount: newsList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 1.0, horizontal: 4.0),
                    child: NewsCard(
                      news: newsList[index],
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            height: isLoading ? 50.0 : 0,
            color: Colors.transparent,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }
}
