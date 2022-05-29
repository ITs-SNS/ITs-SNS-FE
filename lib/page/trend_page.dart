import 'package:flutter/material.dart';

//Widget trendPage = Center(child: Text('Trend'));

Widget trendPage = SizedBox(
    width: double.infinity,
    height: double.infinity,
    child: Image(
        image: NetworkImage('http://172.30.1.52:5000/wordcloud'),
    ),
);

