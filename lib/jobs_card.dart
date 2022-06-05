import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'jobs.dart';

class JobsCard extends StatelessWidget {
  final Jobs jobs;

  const JobsCard({required this.jobs});

  void launchChannel() async {
    if (await canLaunch(jobs.url)) {
      launch(jobs.url, forceWebView: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              jobs.company,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17.0,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 6.0),
            Text(
              jobs.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
            ),
            const SizedBox(height: 6.0),
            SizedBox(
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
            const SizedBox(height: 4.0),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                '~' +
                    jobs.deadline.split('T')[0] +
                    ' ' +
                    jobs.deadline.split('T')[1],
              ),
            ),
            const SizedBox(height: 4.0),
            Align(
              alignment: Alignment.centerRight,
              child: FlatButton.icon(
                onPressed: () {
                  launchChannel();
                },
                label: const Text('apply'),
                icon: const Icon(Icons.arrow_forward_sharp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
