import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final String firstName;
  final String avatarUrl;
  const HeaderWidget(
      {super.key, required this.firstName, required this.avatarUrl});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundImage:
                  NetworkImage(avatarUrl), // Update with the actual URL
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hi", style: TextStyle(fontSize: 16, color: Colors.grey)),
                Text(firstName,
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
        Row(
          children: [
            Icon(Icons.notifications, size: 28),
            SizedBox(width: 10),
            Icon(Icons.nightlight_round, size: 28),
          ],
        ),
      ],
    );
  }
}
