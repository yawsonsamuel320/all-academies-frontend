import 'package:flutter/material.dart';

class UpcomingQuizCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFFFF7CC),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Physics Class Quiz", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text("Equilibrium and Stability", style: TextStyle(color: Colors.grey)),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.access_time, size: 18, color: Colors.grey),
                    SizedBox(width: 5),
                    Text("12:00 PM", style: TextStyle(color: Colors.black)),
                  ],
                ),
                Row(
                  children: [
                    CircleAvatar(radius: 12, backgroundColor: Colors.blue),
                    SizedBox(width: 5),
                    Text("Mrs. Jane Doe", style: TextStyle(color: Colors.black)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
