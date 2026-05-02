import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:my_app3/components/menu1/menu1.dart';
import 'package:my_app3/components/menu2/menu2.dart';
import 'package:my_app3/components/menu3/menu3.dart';
import 'package:my_app3/components/menu4/menu4.dart';

// ignore: camel_case_types
class Main_Menu extends StatefulWidget {
  const Main_Menu({super.key});

  @override
  State<Main_Menu> createState() => _Main_MenuState();
}

// ignore: camel_case_types
class _Main_MenuState extends State<Main_Menu> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Menu1(),
    Menu2(),
    Menu3(),
    Menu4(),
    // Center(child: Text('Page 4')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: _selectedIndex == 0,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop && _selectedIndex != 0) {
          setState(() {
            _selectedIndex = 0; // กลับหน้าแรก
          });
        }
      },
      child: Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: CrystalNavigationBar(
          backgroundColor: const Color.fromARGB(255, 222, 241, 250),
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: [
            CrystalNavigationBarItem(icon: Icons.home),
            CrystalNavigationBarItem(icon: Icons.security_outlined),
            CrystalNavigationBarItem(icon: Icons.access_alarm_sharp),
            CrystalNavigationBarItem(icon: Icons.star),
          ],
        ),
      ),
    );
  }
}
