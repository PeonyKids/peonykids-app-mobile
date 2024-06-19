import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Styles/colors.dart';
import '../../Widgets/widgets.dart';

class Notify extends StatefulWidget {
  const Notify({Key? key}) : super(key: key);

  @override
  State<Notify> createState() => _NotifyState();
}

class _NotifyState extends State<Notify> {
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
          'Notification',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: black),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Receive push notification',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: black),
                  ),
                  Switch(
                    // This bool value toggles the switch.
                    value: false,
                    activeColor: white,
                    inactiveTrackColor: black03,
                    inactiveThumbColor: white,
                    activeTrackColor: primaryColor01,
                    thumbIcon: MaterialStateProperty.resolveWith<Icon?>(
                      (Set<MaterialState> states) {
                        double size = 24.0; // Default size
                        if (states.contains(MaterialState.selected)) {
                          size = 30.0; // Increase size for active thumb
                        }
                        return Icon(
                          Icons.circle, // Default thumb icon
                          size: size,
                          color: white,
                        );
                      },
                    ),
                    onChanged: (bool value) {
                      // toggleButton.toggle();
                      // setState(() {
                      //   val = !val;
                      // });
                      // value = !value;
                      // val();
                    },
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Play sound',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: black),
                  ),
                  Switch(
                    // This bool value toggles the switch.
                    value: true,
                    activeColor: white,
                    inactiveTrackColor: black03,
                    inactiveThumbColor: white,
                    activeTrackColor: primaryColor01,
                    thumbIcon: MaterialStateProperty.resolveWith<Icon?>(
                      (Set<MaterialState> states) {
                        double size = 24.0; // Default size
                        if (states.contains(MaterialState.selected)) {
                          size = 30.0; // Increase size for active thumb
                        }
                        return Icon(
                          Icons.circle, // Default thumb icon
                          size: size,
                          color: white,
                        );
                      },
                    ),
                    onChanged: (bool value) {
                      // toggleButton.toggle();
                      // setState(() {
                      //   val = !val;
                      // });
                      // value = !value;
                      // val();
                    },
                  )
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
