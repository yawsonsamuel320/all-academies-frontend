import 'package:flutter/material.dart';
import 'profile_screen.dart';
import 'grades_screen.dart';
import 'courses_screen.dart';
import 'notifications_screen.dart';
import 'messages_screen.dart';
import 'downloads_screen.dart';
import 'support_screen.dart';
import 'settings_screen.dart';
import 'about_screen.dart';

class MoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("More"),
      ),
      body: ListView(
        children: [
          _buildListTile(context, "Profile", Icons.person, ProfilePage()),
          _buildListTile(context, "My Grades & Reports", Icons.school, GradesScreen()),
          _buildListTile(context, "My Courses", Icons.book, CoursesScreen()),
          _buildListTile(context, "Notifications", Icons.notifications, NotificationsScreen()),
          _buildListTile(context, "Messages", Icons.message, MessagesScreen()),
          _buildListTile(context, "My Downloads", Icons.download, DownloadsScreen()),
          _buildListTile(context, "Support & FAQs", Icons.question_answer, SupportScreen()),
          _buildListTile(context, "Settings", Icons.settings, SettingsScreen()),
          _buildListTile(context, "About All Academies", Icons.info, AboutScreen()),
        ],
      ),
    );
  }

  Widget _buildListTile(BuildContext context, String title, IconData icon, Widget page) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => page)),
    );
  }
}
