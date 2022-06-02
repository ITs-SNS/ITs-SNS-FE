import 'package:flutter/material.dart';
import './page/news_page.dart';
import './page/job_page.dart';
import './server.dart';

dynamic navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(MaterialApp(
    home: NewsList(),
    navigatorKey: navigatorKey,
  ));
}

class NewsList extends StatefulWidget {
  const NewsList({Key? key}) : super(key: key);

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  final tabs = [
    NewsPage(keyword: null),
    JobPage(keyword: null),
  ];

  void _openNewPage() {
    if (_selectedIndex == 0) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: Text('뉴스 키워드'),
              centerTitle: true,
              backgroundColor: Colors.indigo[800],
            ),
            body: Center(
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Image(
                  // image: NetworkImage(address2 + 'newsKeywords'),
                  image: AssetImage('assets/newsKeywords.png'),
                ),
              ),
            ),
          );
        }),
      );
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: Text('채용 공고 키워드'),
              centerTitle: true,
              backgroundColor: Colors.indigo[800],
            ),
            body: Center(
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Image(
                  //image: NetworkImage(address2 + 'jobKeywords'),
                  image: AssetImage('assets/jobKeywords.png'),
                ),
              ),
            ),
          );
        }),
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
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.60),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: '뉴스'),
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
          child: const Icon(Icons.local_fire_department)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
