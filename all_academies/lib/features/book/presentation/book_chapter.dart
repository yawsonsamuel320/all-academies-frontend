import 'package:flutter/material.dart';
import 'package:all_academies/pages/question-answer.dart';
import 'package:all_academies/widgets/text.dart';

class CourseContentPage extends StatelessWidget {
  final String topicSubtitle;
  final String topicContent;

  const CourseContentPage({
    required this.topicSubtitle,
    required this.topicContent,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  QuestionAnswerPage(topicContent: topicContent),
            ),
          );
        },
        backgroundColor: Colors.greenAccent,
        label: const Text('Generate Questions'),
        icon: const Icon(Icons.quiz),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.9),
          child: Column(
            children: [
              BioticSubtitleText(text: topicSubtitle),
              BioticBodyText(text: topicContent),
            ],
          ),
        ),
      ),
    );
  }
}
