import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Styles/colors.dart';
import '../../Widgets/constants.dart';
import '../../Widgets/widgets.dart';

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
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
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: EdgeInsets.only(left: 15.w),
            child: Icon(
              Icons.arrow_back_ios,
              color: black,
            ),
          ),
        ),
        title: Text(
          'Contact Us',
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
                'Phone Number',
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
                  hintText: '',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Your Message',
                style: TextStyle(
                    fontSize: 13, fontWeight: FontWeight.w400, color: black03),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 200,
                child: TextField(
                  // controller: aboutselfController,
                  maxLength: 150,
                  maxLines: 5,
                  keyboardType: TextInputType.multiline,
                  textAlign: TextAlign.start,
                  cursorColor: black,
                  decoration: kTextFieldDecoration.copyWith(
                      filled: true,
                      fillColor: transparent,
                      focusColor: white,
                      hintText: '',
                      counterText: ''),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              reuseButton(onTap: () {}, text: 'Send')
            ],
          ),
        ),
      ),
    );
  }
}
