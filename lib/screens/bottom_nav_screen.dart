import 'package:flutter/material.dart';

import 'home.dart';
import 'profile.dart';
import 'search.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  BottomNavScreenState createState() => BottomNavScreenState();
}

class BottomNavScreenState extends State<BottomNavScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const SearchPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fluttium TEST App'),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: Material(
        elevation: 2,
        child: SizedBox(
          height: 56, // You can adjust the height according to your design
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem('Home', 0, Icons.home),
              _buildNavItem('Search', 1, Icons.search),
              _buildNavItem('Profile', 2, Icons.person),
            ],
          ),
        ),
      ),
    );
  }

  void _onNavItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget _buildNavItem(String label, int index, IconData icon) {
    return Semantics(
      label: label,
      child: InkWell(
        onTap: () => _onNavItemTapped(index),
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Icon(
            icon,
            color: _currentIndex == index
                ? Theme.of(context).colorScheme.onBackground
                : Colors.grey,
          ),
        ),
      ),
    );
  }
}
