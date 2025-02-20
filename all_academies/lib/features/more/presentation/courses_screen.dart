import 'package:flutter/material.dart';

class CoursesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Courses")),
      body: Center(child: Text("List of enrolled courses.")),
    );
  }
}
