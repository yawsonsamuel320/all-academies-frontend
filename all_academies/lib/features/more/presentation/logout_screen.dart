import 'package:flutter/material.dart';

class LogoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Logout"),
      content: Text("Are you sure you want to log out?"),
      actions: [
        TextButton(
          child: Text("Cancel"),
          onPressed: () => Navigator.pop(context),
        ),
        TextButton(
          child: Text("Logout"),
          onPressed: () {
            // Perform logout action
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
