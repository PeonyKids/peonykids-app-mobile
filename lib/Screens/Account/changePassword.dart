import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Styles/colors.dart';
import '../../Widgets/constants.dart';
import '../../Widgets/widgets.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white04,
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: white), // Set the icon color to white
        elevation: 0,
        backgroundColor: white04,
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
          'Change Password',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: black),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Current Password',
                style: TextStyle(
                    fontSize: 13, fontWeight: FontWeight.w400, color: black03),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                cursorColor: black,
                decoration: kTextFieldDecoration.copyWith(
                  filled: true,
                  fillColor: transparent,
                  focusColor: white,
                  hintText: 'Macdonald Anyanwu',
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    color: black03,
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.visibility_outlined,
                      color: black03,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'New Password',
                style: TextStyle(
                    fontSize: 13, fontWeight: FontWeight.w400, color: black03),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                cursorColor: black,
                obscuringCharacter: '*',
                obscureText: true,
                decoration: kTextFieldDecoration.copyWith(
                  filled: true,
                  fillColor: transparent,
                  focusColor: white,
                  hintText: '********',
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    color: black03,
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.visibility_off_outlined,
                      color: black03,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Confirm New Password',
                style: TextStyle(
                    fontSize: 13, fontWeight: FontWeight.w400, color: black03),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                cursorColor: black,
                obscuringCharacter: '*',
                obscureText: true,
                decoration: kTextFieldDecoration.copyWith(
                  filled: true,
                  fillColor: transparent,
                  focusColor: white,
                  hintText: '********',
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    color: black03,
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.visibility_off_outlined,
                      color: black03,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              reuseButton(onTap: () {}, text: 'Save')
            ],
          ),
        ),
      ),
    );
  }
}
