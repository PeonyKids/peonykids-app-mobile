import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../Styles/colors.dart';
import 'contactUs.dart';

class FnS extends StatefulWidget {
  const FnS({Key? key}) : super(key: key);

  @override
  State<FnS> createState() => _FnSState();
}

class _FnSState extends State<FnS> {
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
          'Feedback & Support',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: black),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello our wonderful parents',
                style: TextStyle(
                    fontSize: 17, fontWeight: FontWeight.w600, color: black),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'Get in contact, report a bug or share feedback',
                style: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w400, color: black),
              ),
              SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Contact()),
                  );
                },
                child: query(
                    head: 'Contact Us',
                    body: 'Contact us for any help',
                    svg:
                        'assets/icons/material-symbols_contact-support-rounded.svg'),
              ),
              query(
                  head: 'Report an issue',
                  body: 'Let us know of any bug',
                  svg: 'assets/icons/solar_bug-bold.svg'),
              query(
                  head: 'Request a new feature',
                  body: 'Tell us about a new feature',
                  svg: 'assets/icons/foundation_burst-new.svg'),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding query(
      {required String head, required String body, required String svg}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: whitey,
          borderRadius: BorderRadius.circular(10),
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
          padding: EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    head,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: black),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    body,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: black),
                  ),
                ],
              ),
              SvgPicture.asset(
                svg,
                semanticsLabel: 'My SVG Image',
                height: 45,
                width: 45,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
