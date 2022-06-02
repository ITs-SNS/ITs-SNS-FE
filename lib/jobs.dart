import 'package:flutter/material.dart';
import 'main.dart';
import './page/job_page.dart';
import 'package:http/http.dart' as http;
import 'server.dart';

class Jobs {
  String company;
  String url;
  String deadline;
  String title;
  List<String> keywords;
  List<Widget> chips = List.empty(growable: true);

  Jobs(
      {required this.company,
      required this.url,
      required this.deadline,
      required this.title,
      required this.keywords}) {
    for (int i = 0; i < keywords.length; i++) {
      chips.add(_buildActionChip(keywords[i]));
    }
  }

  TextEditingController _textFieldController = TextEditingController();

  void _openNewPage(String keyword) {
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

  _postRequest(String email, String keyword) async {
    String url = address + 'user_keyword';

    http.Response response =
        await http.post(Uri.parse(url), headers: <String, String>{
      'Content-Type': 'application/x-www-form-urlencoded',
    }, body: <String, String>{
      'user_email': email,
      'user_keyword_content': keyword,
      'user_keyword_type': 'recruit',
    });
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
            children: <Widget>[
              Text('Thank you!'),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '구독 완료',
              ),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("확인"),
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
          title: Text('Email 입력'),
          content: TextField(
            controller: _textFieldController,
            textInputAction: TextInputAction.go,
            decoration: InputDecoration(hintText: "Enter your email"),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('제출'),
              onPressed: () {
                Navigator.of(context).pop();
                infoDialog(context, keyword, _textFieldController.text);
              },
            ),
            FlatButton(
              child: Text('취소'),
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
              children: <Widget>[
                Text('Subscribe'),
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '"#' + keyword + '"' + ' 키워드를 포함한 채용정보를 구독하시겠습니까?',
                ),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: Text("구독"),
                onPressed: () {
                  Navigator.pop(context);
                  emailDialog(context, keyword);
                },
              ),
              FlatButton(
                child: Text("취소"),
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
              children: <Widget>[
                Text('Keywords Recruit'),
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '"#' + keyword + '"' + ' 키워드를 포함한 채용정보를 보시겠습니까?',
                ),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: Text("확인"),
                onPressed: () {
                  Navigator.pop(context);
                  _openNewPage(keyword);
                },
              ),
              FlatButton(
                child: Text("취소"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  Widget _buildActionChip(String label) {
    return Container(
      child: GestureDetector(
        onLongPress: () => subscribeDialog(label),
        child: ActionChip(
          avatar: CircleAvatar(
            child: Text('#'),
            backgroundColor: Colors.white.withOpacity(0.8),
          ),
          label: Text(label),
          onPressed: () => showRelatedDialog(label),
          labelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12.0,
          ),
        ),
      ),
    );
  }
}
