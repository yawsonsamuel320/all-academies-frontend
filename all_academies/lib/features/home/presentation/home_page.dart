import 'package:flutter/material.dart';
import 'widgets/header_widget.dart';
import 'widgets/recent_activity_card.dart';
import 'widgets/schedule_widget.dart';
import 'widgets/upcoming_quiz_card.dart';

class HomePage extends StatelessWidget {
  final String firstName;
  final String avatarUrl;
  const HomePage({super.key, required this.firstName, required this.avatarUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Aligns content to the left
          children: [
            HeaderWidget(
              firstName: firstName,
              avatarUrl: avatarUrl,
            ), // Custom Header Widget
            const SizedBox(height: 10), // Spacing
            const Text(
              "Recent Activity",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            RecentActivityCard(), // Recent Activity Section
            const SizedBox(height: 10),
            Text(
              "Schedule",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            ScheduleWidget(), // Schedule Section
            const SizedBox(height: 10),
            const Text(
              "Upcoming Quiz",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            UpcomingQuizCard(), // Upcoming Quiz Section
          ],
        ),
      )),
    );
  }
}
