import 'package:flutter/material.dart';

class Jobs {
  String company;
  String url;
  List<String> keywords;
  List<Widget> chips = List.empty(growable: true);

  Jobs({ required this.company, required this.url, required this.keywords }) {
    for(int i = 0; i < keywords.length; i++) {
      chips.add(_buildChip(keywords[i]));
    }
  }

  Widget _buildChip(String label) {
    return Chip(
      avatar: CircleAvatar(
        child: Text('#'),
        backgroundColor: Colors.white.withOpacity(0.8),
      ),
      label: Text(label),
      labelStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 12.0,
      ),
    );
  }
}