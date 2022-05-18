import 'package:flutter/material.dart';
import 'news.dart';
import 'news_card.dart';
import './page/news_page.dart';
import './page/trend_page.dart';
import './page/job_page.dart';

void main() => runApp(MaterialApp(
  home: NewsList(),
));

class NewsList extends StatefulWidget {
  const NewsList({Key? key}) : super(key: key);

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  int _selectedIndex = 0;
  final tabs = [
    newsPage,
    trendPage,
    jobPage,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('ITs SNS'),
        centerTitle: true,
        backgroundColor: Colors.indigo[800],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: tabs,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: '뉴스'),
          BottomNavigationBarItem(icon: Icon(Icons.trending_up), label: '트렌드'),
          BottomNavigationBarItem(icon: Icon(Icons.cases), label: '채용공고'),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}





