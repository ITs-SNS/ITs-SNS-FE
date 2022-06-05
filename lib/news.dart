import 'dart:convert';
import 'package:flutter/material.dart';
import 'main.dart';
import './page/news_page.dart';
import 'package:http/http.dart' as http;
import 'server.dart';

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

class News {
  String title;
  String contents;
  String url;
  List<String> keywords;
  List<Widget> chips = List.empty(growable: true);

  News(
      {required this.title,
      required this.contents,
      required this.url,
      required this.keywords}) {
    for (int i = 0; i < keywords.length; i++) {
      chips.add(_buildActionChip(keywords[i]));
    }
  }

  final TextEditingController _textFieldController = TextEditingController();

  _postRequest(String email, String keyword) async {
    String url = address + 'user_keyword';

    final msg = jsonEncode({
      'userEmail': email,
      'userKeywordContent': keyword,
      'userKeywordType': 'news',
    });
    http.Response response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: msg);
  }

  void infoDialog(BuildContext context, String keyword, String email) {
    /* send POST request */
    _postRequest(email, keyword);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          title: Column(
            children: const <Widget>[
              Text('Thank you!'),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              Text(
                '구독 완료',
              ),
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

  void emailDialog(BuildContext context, String keyword) {
    String email = "";

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          title: const Text('Email 입력'),
          content: TextField(
            controller: _textFieldController,
            textInputAction: TextInputAction.go,
            decoration: const InputDecoration(hintText: "Enter your email"),
          ),
          actions: <Widget>[
            FlatButton(
              child: const Text('제출'),
              onPressed: () {
                Navigator.of(context).pop();
                infoDialog(context, keyword, _textFieldController.text);
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

  void subscribeDialog(String keyword) {
    showDialog(
        context: navigatorKey.currentContext,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            title: Column(
              children: const <Widget>[
                Text('Subscribe'),
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '"#' + keyword + '"' + ' 키워드를 포함한 뉴스를 구독하시겠습니까?',
                ),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: const Text("구독"),
                onPressed: () {
                  Navigator.pop(context);
                  emailDialog(context, keyword);
                },
              ),
              FlatButton(
                child: const Text("취소"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  void showRelatedDialog(String keyword) {
    showDialog(
        context: navigatorKey.currentContext,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            title: Column(
              children: const <Widget>[
                Text('Keywords News'),
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '"#' + keyword + '"' + ' 키워드를 포함한 뉴스를 보시겠습니까?',
                ),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: const Text("확인"),
                onPressed: () {
                  Navigator.pop(context);
                  _openKeywordNewsPage(keyword);
                },
              ),
              FlatButton(
                child: const Text("취소"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  Widget _buildActionChip(String label) {
    return GestureDetector(
      onLongPress: () => subscribeDialog(label),
      child: ActionChip(
        avatar: CircleAvatar(
          child: const Text('#'),
          backgroundColor: Colors.white.withOpacity(0.8),
        ),
        label: Text(label),
        onPressed: () => showRelatedDialog(label),
        labelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 12.0,
        ),
      ),
    );
  }
}
