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
    NewsPage(),
    //trendPage,
    JobPage(),
  ];

  void _openNewPage() {
    if (_selectedIndex == 0) {
      Navigator.of(context).push(
        new MaterialPageRoute(
            builder: (BuildContext context) {
              return Scaffold(
                appBar: new AppBar(
                  title: new Text('뉴스 키워드'),
                  centerTitle: true,
                  backgroundColor: Colors.indigo[800],
                ),
                body: new Center(
                  child:
                  SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Image(
                      image: NetworkImage(
                          'http://192.168.35.250:5000/newsKeywords'),
                    ),
                  ),
                ),
              );
            }
        ),
      );
    }
    else {
      Navigator.of(context).push(
        new MaterialPageRoute(
            builder: (BuildContext context) {
              return Scaffold(
                appBar: new AppBar(
                  title: new Text('채용 공고 키워드'),
                  centerTitle: true,
                  backgroundColor: Colors.indigo[800],
                ),
                body: new Center(
                  child:
                  SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Image(
                      image: NetworkImage('http://192.168.35.250:5000/jobKeywords'),
                    ),
                  ),
                ),
              );
            }
        ),
      );
    }
  }

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
        backgroundColor: Colors.indigo[800],
        // shape: const CircularNotchedRectangle(),
        // notchMargin: 6,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.60),
        items: const <BottomNavigationBarItem>[

          BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: '뉴스'),
          //BottomNavigationBarItem(icon: Icon(Icons.trending_up), label: '트렌드'),
          BottomNavigationBarItem(icon: Icon(Icons.cases), label: '채용공고'),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openNewPage,
        backgroundColor: Colors.indigo[800],
        child: const Icon(Icons.local_fire_department)
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}





