import 'package:flutter/material.dart';

class DownloadsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Downloads")),
      body: Center(child: Text("Downloaded files list.")),
    );
  }
}
