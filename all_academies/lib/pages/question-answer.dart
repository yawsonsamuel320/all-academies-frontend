import 'package:flutter/material.dart';
import 'package:all_academies/widgets/text.dart';
import 'package:all_academies/widgets/themes.dart';
import 'package:all_academies/pages/second-screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class QuestionAnswerPage extends StatefulWidget {
  final String topicContent;

  const QuestionAnswerPage({required this.topicContent, super.key});

  @override
  State<QuestionAnswerPage> createState() => _QuestionAnswerPageState();
}

class _QuestionAnswerPageState extends State<QuestionAnswerPage> {
  List<Map<String, dynamic>> _questions = [];
  bool _isLoading = true;
  int _currentQuestionIndex = 0;

  @override
  void initState() {
    super.initState();
    _fetchQuestions();
  }

  Future<void> _fetchQuestions() async {
    try {
      final response = await http.post(
        Uri.parse('http://localhost:8000/questions/generate'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'text': widget.topicContent}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _questions = List<Map<String, dynamic>>.from(data['set']);
          _isLoading = false;
        });
      } else {
        throw Exception('Failed to fetch questions');
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      // Handle error (e.g., show error message)
    }
  }

  Future<void> _evaluateResponse(String attemptedResponse) async {
    final questionData = _questions[_currentQuestionIndex];

    try {
      final response = await http.post(
        Uri.parse('http://localhost:8000/evaluations/'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'question': questionData['question'],
          'expected_response': questionData['sample_answer'],
          'attempted_response': attemptedResponse,
          'allocated_mark': questionData['allocated_mark'],
        }),
      );

      if (response.statusCode == 200) {
        final evaluation = jsonDecode(response.body)['evaluation'];
        print(questionData);
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: BioticSubtitleText(text: 'Evaluation Result'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(evaluation['explantion_of_evaluation'] ?? ''),
                const SizedBox(height: 10),
                Text('Mark Scored: ${evaluation['score'] ?? 'N/A'}'),
                const SizedBox(
                  height: 20,
                ),
                BioticBoldText(text: 'Expected Response'),
                Text(questionData['sample_answer'])
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _goToNextQuestion();
                },
                child: const Text('Close'),
              )
            ],
          ),
        );
      } else {
        throw Exception('Failed to evaluate response');
      }
    } catch (e) {
      // Handle error (e.g., show error message)
    }
  }

  void _goToNextQuestion() {
    if (_currentQuestionIndex < _questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
      });
    } else {
      _showCompletionDialog();
    }
  }

  void _showCompletionDialog() {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: const Text('Quiz Completed'),
              content: const Text('You have answered all the questions.'),
              actions: [
                TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Close'))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Question and Answer'),
        ),
        body: const Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(
              height: 20,
            ),
            Text('Generating Question... ')
          ],
        )),
      );
    }

    if (_questions.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Question & Answer'),
        ),
        body: const Center(child: Text('No questions available')),
      );
    }

    final currentQuestion = _questions[_currentQuestionIndex];
    final controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: LinearProgressIndicator(
          value: _currentQuestionIndex + 1 / _questions.length,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Question ${_currentQuestionIndex + 1}'),
            Text(
              currentQuestion['question'] ?? '',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your answer',
              ),
              maxLines: null,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  _evaluateResponse(controller.text);
                },
                child: const Text('Submit Answer'))
          ],
        ),
      ),
    );

    ;
  }
}
