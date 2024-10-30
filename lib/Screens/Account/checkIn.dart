import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Styles/colors.dart';

class CheckInNOut extends StatefulWidget {
  const CheckInNOut({Key? key}) : super(key: key);

  @override
  State<CheckInNOut> createState() => _CheckInNOutState();
}

class _CheckInNOutState extends State<CheckInNOut> {
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
          'Check In/Out',
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
                'Today',
                style: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w400, color: black03),
              ),
              SizedBox(
                height: 10,
              ),
              checkTime(time: '4:00pm', color: primaryColor02),
              checkTime(time: '8:30am', color: primaryColor01),
              SizedBox(
                height: 10,
              ),
              Text(
                'Yesterday',
                style: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w400, color: black03),
              ),
              SizedBox(
                height: 10,
              ),
              checkTime(time: '4:00pm', color: primaryColor02),
              checkTime(time: '8:30am', color: primaryColor01),
              SizedBox(
                height: 10,
              ),
              Text(
                '2 days ago',
                style: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w400, color: black03),
              ),
              SizedBox(
                height: 10,
              ),
              checkTime(time: '4:00pm', color: primaryColor02),
              checkTime(time: '8:30am', color: primaryColor01),
              SizedBox(
                height: 10,
              ),
              Text(
                '3 days ago',
                style: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w400, color: black03),
              ),
              SizedBox(
                height: 10,
              ),
              checkTime(time: '4:00pm', color: primaryColor02),
              checkTime(time: '8:30am', color: primaryColor01),
              Divider(
                // height: 12,
                color: grey,
                thickness: 2.0,
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
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
                        'This page would be automatically refreshed weekly',
                        style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            color: black03),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  checkTime({required String time, required Color color}) {
    String text = '';
    color == primaryColor02 ? text = 'Check Out at' : text = 'Check In at';

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        padding: EdgeInsets.only(left: 15, top: 10, bottom: 10),
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: white,
          border: Border(
            left: BorderSide(color: color, width: 3.0),
          ),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
        ),
        child: Text(
          '$text $time',
          style: TextStyle(
              fontSize: 17, fontWeight: FontWeight.w600, color: black),
        ),
      ),
    );
  }
}
