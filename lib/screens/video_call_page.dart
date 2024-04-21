import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class VideoCallPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Join Google Meet'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            const url = 'https://meet.google.com/yom-fdnq-fca';
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Could not launch $url'),
                ),
              );
            }
          },
          child: Text('Join Meeting'),
        ),
      ),
    );
  }
}
