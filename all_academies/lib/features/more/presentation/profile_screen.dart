import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/user_provider.dart';
import 'edit_profile_page.dart';

class ProfilePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(userProvider);

    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: userState.when(
        data: (user) {
          if (user == null) {
            return Center(child: Text("User not found"));
          }

          return Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(user["avatar"] ?? ""),
                ),
                SizedBox(height: 16),
                Text("${user['first_name']} ${user['last_name']}",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text(user['email'],
                    style: TextStyle(fontSize: 16, color: Colors.grey)),
                SizedBox(height: 8),
                Text("User Type: ${user['user_type']}",
                    style: TextStyle(fontSize: 16)),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to edit profile page
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditProfilePage(user: user)));
                  },
                  child: Text("Edit Profile"),
                ),
              ],
            ),
          );
        },
        loading: () => Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text("Error loading profile")),
      ),
    );
  }
}
