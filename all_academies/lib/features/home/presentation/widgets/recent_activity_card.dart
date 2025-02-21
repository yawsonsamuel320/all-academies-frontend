import 'package:flutter/material.dart';

class RecentActivityListView extends StatelessWidget {
  final List recentEvents;
  const RecentActivityListView({super.key, required this.recentEvents});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: recentEvents.length,
      itemBuilder: (context, index) {
        final event = recentEvents[index];
        return RecentActivityCard(
          subject: event['subject'],
          title: event['title'],
          type: event['type'],
          imageUrl: event['imageUrl'],
        );
      },
    );
  }
}

class RecentActivityCard extends StatelessWidget {
  final String? imageUrl;
  final String subject;
  final String title;
  final String type;

  const RecentActivityCard(
      {super.key,
      required this.subject,
      required this.title,
      required this.type,
      this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: [
            Image.network(
              imageUrl ??
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSX_h1zNFEyNEJ7ESboE7v_VeFznMtxQ2Pp0w&s",
              width: 50,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(subject,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  Text(title,
                      style: TextStyle(color: Colors.grey, fontSize: 12)),
                  SizedBox(height: 5),
                  LinearProgressIndicator(
                      value: 1.0,
                      color: const Color.fromARGB(255, 228, 225, 197),
                      backgroundColor: Colors.grey[300]),
                  SizedBox(height: 5),
                  Text(type,
                      style: TextStyle(color: Colors.black, fontSize: 12)),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          padding: EdgeInsets.symmetric(
                              horizontal: 17, vertical: 2)),
                      onPressed: () {},
                      child: Text("Review Quiz",
                          style: TextStyle(color: Colors.white, fontSize: 12)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
