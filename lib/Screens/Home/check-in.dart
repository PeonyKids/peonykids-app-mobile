import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Styles/colors.dart';

class CheckIn extends StatefulWidget {
  const CheckIn({Key? key}) : super(key: key);

  @override
  State<CheckIn> createState() => _CheckInState();
}

class _CheckInState extends State<CheckIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: white), // Set the icon color to white
        elevation: 0,
        backgroundColor: white,
        leading: GestureDetector(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.only(left: 15.w),
            child: Icon(
              Icons.arrow_back_ios,
              color: black,
            ),
          ),
        ),
        title: Text(
          'Check In',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: black),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        padding: EdgeInsets.only(top: 10, left: 15.w, right: 15.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Please select the child you want to check in. You will be required to scan the QR provided.',
              style: TextStyle(
                  fontSize: 15, fontWeight: FontWeight.w400, color: black),
            ),
            SizedBox(
              height: 15,
            ),
            checkIn(name: 'Macdonald'),
            checkIn(name: 'Ben'),
            checkIn(name: 'Anne'),
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
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      // contentPadding: EdgeInsets.symmetric(
                      //     horizontal: 20, vertical: 20), // Adjust padding
                      backgroundColor: white,
                      title: Text(
                        'Group Check In',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w600,
                            color: black),
                      ),
                      content: Text('Choose the child you want to check in.'),
                      actions: <Widget>[
                        Container(
                          height: 40,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: black,
                              ),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 3,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Select all',
                              ),
                              Checkbox(value: false, onChanged: (value) {})
                            ],
                          ),
                        ),
                        Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: black,
                              ),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 3,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Macdonald',
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                    color: black),
                              ),
                              Checkbox(value: false, onChanged: (value) {})
                            ],
                          ),
                        ),
                        Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: black,
                              ),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 3,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Ben',
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                    color: black),
                              ),
                              Checkbox(value: false, onChanged: (value) {})
                            ],
                          ),
                        ),
                        Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: black,
                              ),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 3,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Anne',
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                    color: black),
                              ),
                              Checkbox(value: false, onChanged: (value) {})
                            ],
                          ),
                        ),
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
                                gradient: customGradient),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Center(
                                child: Text(
                                  'Check In',
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                      color: white),
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
                                      color: black),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: primaryColor01.withOpacity(0.2), // Shadow color
                        offset: Offset(0.0, 7.0), // Offset from right
                        blurRadius: 8, // Spread of the shadow
                        spreadRadius: 0.0,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Group check in',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: black),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Tap to check in multiple kids at once',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: black),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.qr_code_scanner,
                          size: 30,
                          color: primaryColor02,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }

  Padding checkIn({required String name}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: primaryColor01.withOpacity(0.2), // Shadow color
              offset: Offset(0.0, 7.0), // Offset from right
              blurRadius: 8, // Spread of the shadow
              spreadRadius: 0.0,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: black),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Tap to check in $name',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: black),
                  ),
                ],
              ),
              Icon(
                Icons.qr_code_scanner,
                size: 30,
                color: primaryColor02,
              )
            ],
          ),
        ),
      ),
    );
  }
}
