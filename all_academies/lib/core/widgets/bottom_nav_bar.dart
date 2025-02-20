import 'package:flutter/material.dart';
import '../../features/home/presentation/home_page.dart';
import '../../features/courses/presentation/courses_screen.dart';
import '../../features/library/presentation/library_screen.dart';
import '../../features/groups/presentation/groups_screen.dart';
import '../../features/more/presentation/more_screen.dart';

class BottomNavBar extends StatefulWidget {
  final String firstName;
  final String avatarUrl;

  BottomNavBar({super.key, required this.firstName, required this.avatarUrl});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      HomePage(
        firstName: widget.firstName,
        avatarUrl: widget.avatarUrl,
      ), // Changed from HomeScreen() to HomePage()
      CoursesScreen(),
      LibraryScreen(),
      GroupsScreen(),
      MoreScreen(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.menu_book), label: "Courses"),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_books), label: "Library"),
          BottomNavigationBarItem(icon: Icon(Icons.groups), label: "Groups"),
          BottomNavigationBarItem(icon: Icon(Icons.apps), label: "More"),
        ],
      ),
    );
  }
}
