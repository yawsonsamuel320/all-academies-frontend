import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("About All Academies")),
      body: Center(child: Text("Information about the platform.")),
    );
  }
}
