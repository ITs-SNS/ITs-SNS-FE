import 'package:flutter/material.dart';
import '../jobs.dart';
import '../jobs_card.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../server.dart';

class JobPage extends StatefulWidget {
  String? keyword = null;

  JobPage({required this.keyword});

  @override
  State<JobPage> createState() => _JobPageState();
}

class _JobPageState extends State<JobPage> {
  int page = 0;
  List<Jobs> jobsList = List.empty(growable: true);
  bool isLoading = false;

  Future _loadData() async {
    await Future.delayed(Duration(seconds: 2));
    print("load more");
    setState(() {
      fetchJob(widget.keyword);
      isLoading = false;
    });
  }

  void fetchJob(String? keyword) async {
    String url = address + "recruit_list?page=" + page.toString();
    if (keyword != null) {
      url += "&keyword=" + keyword;
    }
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(utf8.decode(response.bodyBytes));
      List<dynamic> tmpList = json['recruitList'];
      List<Jobs> JobListDTO = List.empty(growable: true);
      print(tmpList.length);
      for (int i = 0; i < tmpList.length; i++) {
        List<dynamic> keywordJsonList = tmpList[i]['recruitKeywordList'];
        List<String> keywordList = List.empty(growable: true);

        for (int j = 0; j < keywordJsonList.length; j++) {
          keywordList.add(keywordJsonList[j]['keywordContent']);
        }

        JobListDTO.add(Jobs(
          title: tmpList[i]['recruitTitle'],
          company: tmpList[i]['recruitCompany'],
          deadline: tmpList[i]['recruitEndDate'],
          keywords: keywordList,
          url: tmpList[i]['recruitUrl'],
        ));
      }
      setState(() {
        jobsList.addAll(JobListDTO);
        page++;
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchJob(widget.keyword);
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
                itemCount: jobsList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 1.0, horizontal: 4.0),
                    child: JobsCard(
                      jobs: jobsList[index],
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
              child: new CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }
}
