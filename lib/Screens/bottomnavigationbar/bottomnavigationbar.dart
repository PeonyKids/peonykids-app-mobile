import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// import '../Screens/Account/account.dart';
// import '../Screens/Home/homepage.dart';
// import '../Styles/colors.dart';
// import '../home.dart';
// import '../notifications.dart';
import '../../Styles/colors.dart';
import '../Account/account.dart';
import '../Home/homepage.dart';
import '../Home/notifications.dart';
import '../store/storepage.dart';

class bottomnavigationbar extends StatefulWidget {
  const bottomnavigationbar({super.key});

  @override
  State<bottomnavigationbar> createState() => _bottomnavigationbarState();
}

class _bottomnavigationbarState extends State<bottomnavigationbar> {
  List pages = [Homepage(), storepage(), NotificationPage(), AccountPage()];
  int selectedNumber = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[selectedNumber],
        bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 13,
          selectedItemColor: black,
          unselectedItemColor: Color(0xFF404040),
          unselectedLabelStyle: TextStyle(color: Color(0xFF595959)),
          selectedLabelStyle:
              TextStyle(color: black, fontWeight: FontWeight.bold),
          currentIndex: selectedNumber,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/Home.svg',
                semanticsLabel: 'My SVG Image',
                // height: 42.h,
                // width: 42.w,
                // height: 40,
                // width: 0,
              ),
              activeIcon: SvgPicture.asset(
                'assets/icons/activeHome.svg',
                semanticsLabel: 'My SVG Image',
                height: 25,
                width: 25,
                color: black,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/store.svg',
                semanticsLabel: 'My SVG Image',
                // height: 42.h,
                // width: 42.w,
              ),
              activeIcon: SvgPicture.asset(
                'assets/icons/activeShop.svg',
                semanticsLabel: 'My SVG Image',
                height: 25,
                width: 25,
                color: black,
              ),
              label: 'Store',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/Notification.svg',
                semanticsLabel: 'My SVG Image',
                // height: 42.h,
                // width: 42.w,
              ),
              activeIcon: SvgPicture.asset(
                'assets/icons/activeNotification.svg',
                semanticsLabel: 'My SVG Image',
                height: 25,
                width: 25,
                color: black,
              ),
              label: 'Notification',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/Profile.svg',
                semanticsLabel: 'My SVG Image',
                // height: 42.h,
                // width: 42.w,
              ),
              activeIcon: SvgPicture.asset(
                'assets/icons/activeProfile.svg',
                semanticsLabel: 'My SVG Image',
                height: 25,
                width: 25,
                color: black,
              ),
              label: 'Account',
            ),
          ],
          onTap: (value) {
            setState(() {
              selectedNumber = value;
            });
          },
        ));
  }
}