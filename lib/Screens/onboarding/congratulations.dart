import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Styles/colors.dart';
import '../../Widgets/widgets.dart';
import '../bottomnavigationbar/bottomnavigationbar.dart';

class congratulations extends StatefulWidget {
  const congratulations({super.key});

  @override
  State<congratulations> createState() => _congratulationsState();
}

class _congratulationsState extends State<congratulations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 30, left: 20.w, right: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/congratulations.png'),
                Text('Congratulations', style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600
                ),),
                SizedBox(height: 10,),
                Text('Your setup is complete and have been submitted for approval which would take less than 24hours. You would be notified!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: black03
                  )
                ),
                SizedBox(height: 50,),
                normalButton(onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => bottomnavigationbar()),
                  );
                }, text: 'Continue', color: primaryColor01)
              ],
            ),
          ),
        ),
      ),
    );
  }
}