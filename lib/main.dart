import 'package:flutter/material.dart';
import './page/news_page.dart';
import './page/job_page.dart';
import './util/special_icon.dart';
import './server.dart';

dynamic navigatorKey = GlobalKey<NavigatorState>();
int _selectedIndex = 0;

void main() {
  runApp(MaterialApp(
    home: const NewsList(),
    navigatorKey: navigatorKey,
  ));
}

void _openKeywordNewsPage(String keyword) {
  Navigator.of(navigatorKey.currentContext).push(
    MaterialPageRoute(builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('#' + keyword + ' 키워드 뉴스'),
          centerTitle: true,
          backgroundColor: Colors.indigo[800],
        ),
        body: NewsPage(keyword: keyword),
      );
    }),
  );
}

void _openKeywordJobPage(String keyword) {
  Navigator.of(navigatorKey.currentContext).push(
    MaterialPageRoute(builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('#' + keyword + ' 키워드 채용공고'),
          centerTitle: true,
          backgroundColor: Colors.indigo[800],
        ),
        body: JobPage(keyword: keyword),
      );
    }),
  );
}

void searchDialog(BuildContext context) {
  String email = "";

  TextEditingController _textFieldController = TextEditingController();
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        title: const Text('Keyword 검색'),
        content: TextField(
          controller: _textFieldController,
          textInputAction: TextInputAction.go,
          decoration: const InputDecoration(hintText: "관심있는 키워드를 입력하세요"),
        ),
        actions: <Widget>[
          FlatButton(
            child: const Text('검색'),
            onPressed: () {
              Navigator.of(context).pop();
              if (_selectedIndex == 0) {
                _openKeywordNewsPage(_textFieldController.text);
              } else if (_selectedIndex == 1) {
                _openKeywordJobPage(_textFieldController.text);
              }
              //infoDialog(context, keyword, _textFieldController.text);
            },
          ),
          FlatButton(
            child: const Text('취소'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

void infoDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        title: Column(
          children: const <Widget>[
            Text('Application Info'),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            Text(
              'Developed by team AIM',
            ),
            Text(
              'Sogang University',
            ),
            Text('2022.06.04'),
          ],
        ),
        actions: <Widget>[
          FlatButton(
            child: const Text("확인"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}

class NewsList extends StatefulWidget {
  const NewsList({Key? key}) : super(key: key);

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList>
    with SingleTickerProviderStateMixin {
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
              title: const Text('뉴스 키워드'),
              centerTitle: true,
              backgroundColor: Colors.indigo[800],
            ),
            body: Center(
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Image(
                  image: NetworkImage(address2 + 'newsKeywords'),
                  //image: AssetImage('assets/newsKeywords.png'),
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
              title: const Text('채용 공고 키워드'),
              centerTitle: true,
              backgroundColor: Colors.indigo[800],
            ),
            body: Center(
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Image(
                  image: NetworkImage(address2 + 'jobKeywords'),
                  //image: AssetImage('assets/jobKeywords.png'),
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
        title: const Text('ITs SNS'),
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
      floatingActionButton: ExpandableFab(
        distance: 100.0,
        children: [
          ActionButton(
            onPressed: () {
              infoDialog(navigatorKey.currentContext);
            },
            icon: const Icon(Icons.info),
          ),
          ActionButton(
            onPressed: () {
              searchDialog(navigatorKey.currentContext);
            },
            icon: const Icon(Icons.search),
          ),
          ActionButton(
            onPressed: () {
              _openNewPage();
            },
            icon: const Icon(Icons.local_fire_department),
          ),
        ],
      ),
    );
  }
}
