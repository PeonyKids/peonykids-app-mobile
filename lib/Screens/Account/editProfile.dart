import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../Styles/colors.dart';
import '../../constants.dart';
import '../../widgets.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
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
          'Edit Profile',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: black),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    Container(
                      height: 130,
                      width: 130,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/flower.png'),
                        ),
                        // border: Border.all(color: black),
                      ),
                      child: Center(
                          child: Image.asset(
                        'assets/avatars/img.png',
                        height: 100,
                        width: 100,
                      )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: black)),
                      ),
                      child: IntrinsicWidth(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/bx_edit.svg',
                              semanticsLabel: 'My SVG Image',
                              height: 25,
                              width: 25,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Change Picture',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: black),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                'Name of Child',
                style: TextStyle(
                    fontSize: 15, fontWeight: FontWeight.w400, color: black),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                cursorColor: black,
                decoration: kTextFieldDecoration.copyWith(
                  filled: true,
                  fillColor: white,
                  hintText: 'Macdonald Anyanwu',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Age of Child',
                style: TextStyle(
                    fontSize: 15, fontWeight: FontWeight.w400, color: black),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                cursorColor: black,
                decoration: kTextFieldDecoration.copyWith(
                  filled: true,
                  fillColor: white,
                  hintText: '02-02-2023',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Name of Parents',
                style: TextStyle(
                    fontSize: 15, fontWeight: FontWeight.w400, color: black),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                cursorColor: black,
                decoration: kTextFieldDecoration.copyWith(
                  filled: true,
                  fillColor: white,
                  hintText: 'Mr & Mrs. Innocent Anyanwu',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    color: black03,
                    size: 20,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Expanded(
                    child: Text(
                      'You could add titles, Eg. Mr & Mrs John Doe',
                      style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          color: black03),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
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
