import 'package:flutter/material.dart';
import 'package:peony_app_kazeem/home.dart';
import 'package:peony_app_kazeem/store/storepage.dart';

class bottomnavigationbar extends StatefulWidget {
  const bottomnavigationbar({super.key});

  @override
  State<bottomnavigationbar> createState() => _bottomnavigationbarState();
}

class _bottomnavigationbarState extends State<bottomnavigationbar> {
  List pages = [home(), storepage(), home(), home()];
  int selectedNumber = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[selectedNumber],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Color(0xff64436E),
          unselectedItemColor:  Color(0xFF404040),
          unselectedLabelStyle: TextStyle(color: Color(0xFF595959)),
          selectedLabelStyle: TextStyle(color: Color(0xff64436E)),
          currentIndex: selectedNumber,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
              
                label: 'Home'),
             BottomNavigationBarItem(
                icon: Icon(Icons.store_outlined),
              
                label: 'Store'),
                  BottomNavigationBarItem(
                icon: Icon(Icons.notifications_outlined),
              
                label: 'Notification'),
                  BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
              
                label: 'Account'),
          ],
          onTap: (value) {
            setState(() {
              selectedNumber = value;
            });
          },
        ));
  }
}
