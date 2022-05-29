import 'package:flutter/material.dart';
import 'jobs.dart';

class JobsCard extends StatelessWidget {
  final Jobs jobs;
  JobsCard({ required this.jobs });



  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              jobs.company,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17.0,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 6.0),

            Container(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: jobs.chips.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      height: 50,
                      padding: const EdgeInsets.all(5),
                      child: jobs.chips[index]
                  );
                }
              ),
            ),

            SizedBox(height: 8.0),

          ],
        ),
      ),
    );
  }
}





