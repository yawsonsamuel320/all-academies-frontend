import 'package:flutter/material.dart';

class GradesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Grades & Reports")),
      body: Center(child: Text("List of courses and grades.")),
    );
  }
}
