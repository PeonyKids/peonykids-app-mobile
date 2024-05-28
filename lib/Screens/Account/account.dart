import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:peonyapp/Screens/Account/viewInvoice.dart';
import 'package:peonyapp/Styles/colors.dart';

import '../../store/orders.dart';
import 'changePassword.dart';
import 'checkIn.dart';
import 'editProfile.dart';
import 'feedback.dart';
import 'notification.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white04,
      body: SafeArea(
          child: SingleChildScrollView(
        padding: EdgeInsets.only(top: 30, left: 15.w, right: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 110,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    child: Image.asset(
                      'assets/avatars/img.png',
                      height: 110,
                      width: 100,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Macdonald Anyanwu',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                            height: 5), // Add some spacing between the text

                        Row(
                          children: [
                            Text(
                              'Age: ',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                  color: black03),
                            ),
                            Expanded(
                              child: RichText(
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                text: TextSpan(
                                  text: "12 months ",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: black),
                                  children: [
                                    // const WidgetSpan(
                                    //   child: SizedBox(
                                    //     width: 5,
                                    //   ),
                                    // ),
                                    TextSpan(
                                      text: '(03/02/2023)',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                        color: black,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                            height: 5), // Add some spacing between the text
                        Row(
                          children: [
                            Text(
                              'Parents: ',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                  color: black03),
                            ),
                            Expanded(
                              // Use Expanded to allow the text to take up available space
                              child: Text(
                                'Innocent & Ify Anyanwu',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w400),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Device Log In : 1',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'You are only allowed to log in two devices using the child’s name',
              style: TextStyle(
                  fontSize: 15, fontWeight: FontWeight.w400, color: black),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              height: 80,
              // width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: primaryColor01.withOpacity(0.9)),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Daycare Fees',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: white),
                        ),
                        Row(
                          children: [
                            Text(
                              '₦100,000 •',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  color: white),
                            ),
                            Text(
                              ' Unpaid',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: white),
                            ),
                          ],
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CheckInvoice()),
                        );
                      },
                      child: Container(
                        height: 40,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: white),
                        child: Center(
                          child: Text(
                            'View Invoice',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: primaryColor01),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              // height: 12,
              color: black03,
              thickness: 1.0,
            ),
            SizedBox(
              height: 10,
            ),
            profiles(
                text: 'Edit Profile',
                tap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditProfile()),
                  );
                }),
            profiles(
                text: 'My Orders',
                tap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => orders()),
                  );
                }),
            profiles(
                text: 'View all Check Ins',
                tap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CheckInNOut()),
                  );
                }),
            profiles(
                text: 'Feedback & Support',
                tap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FnS()),
                  );
                }),
            profiles(
                text: 'Change Password',
                tap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChangePassword()),
                  );
                }),
            profiles(
                text: 'Notification',
                tap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Notify()),
                  );
                }),
            profiles(text: 'Gallery', tap: () {}),
            profiles(
                text: 'Logout',
                tap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Theme(
                        data: ThemeData(
                          dialogTheme: DialogTheme(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                        ),
                        child: AlertDialog(
                          // shape: RoundedRectangleBorder(
                          //   borderRadius: BorderRadius.circular(15.0),
                          // ),
                          // contentPadding: EdgeInsets.symmetric(
                          //     horizontal: 20, vertical: 20), // Adjust padding
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20), // Adjust content padding
                          backgroundColor: Colors.white,
                          title: Text(
                            'Confirm Log Out?',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: black,
                                fontFamily: 'WorkSans'),
                          ),
                          content: Text(
                            'Are you sure you want to log out? We would love you to stay',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: black,
                                fontFamily: 'WorkSans'),
                          ),
                          actions: <Widget>[
                            SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                // height: 40,
                                // width: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Color(0xffFFEBEB)),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Center(
                                    child: Text(
                                      'Log Out',
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xffCC0000),
                                          fontFamily: 'WorkSans'),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                // height: 40,
                                // width: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: transparent),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Center(
                                    child: Text(
                                      'Cancel',
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                          color: black,
                                          fontFamily: 'WorkSans'),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/logos_facebook.svg',
                        semanticsLabel: 'My SVG Image',
                        height: 30.h,
                        width: 30.w,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SvgPicture.asset(
                        'assets/icons/skill-icons_instagram.svg',
                        semanticsLabel: 'My SVG Image',
                        height: 30.h,
                        width: 30.w,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    '12, The Rock Mews, Rock Drive (by IMAX Cinemas), Lekki Phase 1, Lagos Nigeria.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: black03),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      )),
    );
  }

  profiles({required String text, required VoidCallback tap}) {
    return GestureDetector(
      onTap: tap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: Container(
          height: 60,
          // width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: white,
            boxShadow: [
              BoxShadow(
                color: primaryColor01.withOpacity(0.1), // Shadow color
                offset: Offset(0.0, 0.0), // Offset from right
                blurRadius: 1, // Spread of the shadow
                spreadRadius: 0.0,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w400, color: black),
                ),
                Icon(
                  Icons.arrow_forward,
                  size: 30,
                  color: black,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
