import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:qoutes_daily/Pages/favourite_page.dart';
import 'package:qoutes_daily/Pages/home_page.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;

  static final List<Widget> _screens = [
    const HomeScreen(),
    const FavoritesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Daily Quotes" ,
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        ) ,
        backgroundColor: Colors.black,
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: GNav(
        gap: 8,
        backgroundColor: Colors.black,
        color: Colors.grey[600],
        activeColor: Colors.black,
        tabBackgroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        selectedIndex: _selectedIndex,
        onTabChange: (index) {
          setState(() => _selectedIndex = index);
        },
        tabs: const [
          GButton(
            icon: Icons.home,
            text: 'Home',
          ),
          GButton(
            icon: Icons.favorite,
            text: 'Favorites',
          ),
        ],
      ),
    );
  }
}
