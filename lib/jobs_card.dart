import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'jobs.dart';

class JobsCard extends StatelessWidget {
  final Jobs jobs;

  JobsCard({required this.jobs});

  void launchChannel() async {
    if (await canLaunch(jobs.url)) {
      launch(jobs.url, forceWebView: true);
    }
  }

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
            Text(
              jobs.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
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
                        child: jobs.chips[index]);
                  }),
            ),
            SizedBox(height: 4.0),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                '~' +
                    jobs.deadline.split('T')[0] +
                    ' ' +
                    jobs.deadline.split('T')[1],
              ),
            ),
            SizedBox(height: 4.0),
            Align(
              alignment: Alignment.centerRight,
              child: FlatButton.icon(
                onPressed: () {
                  launchChannel();
                },
                label: Text('apply'),
                icon: Icon(Icons.arrow_forward_sharp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
