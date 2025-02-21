import 'package:flutter/material.dart';
import 'widgets/header_widget.dart';
import 'widgets/recent_activity_card.dart';
import 'widgets/schedule_widget.dart';
import 'widgets/upcoming_quiz_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:all_academies/features/auth/data/auth_providers.dart';

class HomePage extends ConsumerStatefulWidget {
  Map<String, dynamic>? userDetails;

  HomePage({super.key, required this.userDetails});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  Future<void> _pullRefresh() async {
    setState(() => isLoading = true);

    final authRepo = ref.read(authRepositoryProvider);

    Map<String, dynamic>? userDetails = await authRepo.getCurrentUser();

    setState(() {
      widget.userDetails = userDetails;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: RefreshIndicator(
            child: SafeArea(
                child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Aligns content to the left
                children: [
                  HeaderWidget(
                    firstName: widget.userDetails?['first_name'] ?? '',
                    avatarUrl: widget.userDetails?['avatar'],
                  ), // Custom Header Widget
                  const SizedBox(height: 40), // Spacing
                  const Text(
                    "Recent Activity",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 150,
                    child: RecentActivityListView(
                      recentEvents:
                          (widget.userDetails?['events'] ?? []).where((event) {
                        final eventDate = DateTime.parse(event['date']);
                        final currentDate = DateTime.now();
                        return eventDate.isBefore(currentDate) &&
                            eventDate.isAfter(
                                currentDate.subtract(Duration(days: 5)));
                      }).toList(),
                    ),
                  ),
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
            onRefresh: _pullRefresh));
  }
}
