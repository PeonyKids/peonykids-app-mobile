import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../Styles/colors.dart';

class MyOutlinedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final ButtonStyle? style;
  final Gradient? gradient;
  final double thickness;

  const MyOutlinedButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.style,
    this.gradient,
    this.thickness = 1,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          gradient: gradient, borderRadius: BorderRadius.circular(25)),
      child: Container(
        color: transparent,
        margin: EdgeInsets.all(thickness),
        child: ElevatedButton(
          onPressed: onPressed,
          style: style,
          child: child,
        ),
      ),
    );
  }
}

GestureDetector reuseButton(
    {required VoidCallback onTap, required String text}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      // height: 40,
      // width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: primaryColor01,

        boxShadow: [
          BoxShadow(
            color: black01.withOpacity(0.2), // Shadow color
            offset: Offset(0.0, 7.0), // Offset from right
            blurRadius: 8, // Spread of the shadow
            spreadRadius: 0.0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w600, color: white),
          ),
        ),
      ),
    ),
  );
}

GestureDetector normalButton ({required VoidCallback onTap, required String text, required Color color}){
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(25)),
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontFamily: 'WorkSans', fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ),
  );
}


GestureDetector shadowButton ({required VoidCallback onTap, required String text, required Color color}){
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: color,
        boxShadow: [
          BoxShadow(
            color: black01.withOpacity(0.3), // Shadow color
            offset: Offset(0.0, 7.0), // Offset from right
            blurRadius: 8, // Spread of the shadow
            spreadRadius: 0.0,
          ),
        ],
      ),
      child: Center(
          child: Text(text,
            style: TextStyle(
                color: white,
                fontWeight: FontWeight.w600,
                fontSize: 16),)
      ),
    ),
  );
}


tracker({
  required String type,
  required String head,
  required String time,
  String? subhead,
  String? subhead2,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 30),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          type,
          semanticsLabel: 'My SVG Image',
          height: 50.h,
          width: 50.w,
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: 5.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  head,
                  style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (subhead != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      subhead,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                if (subhead2 != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      subhead2,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 5.h),
          child: Row(
            children: [
              Icon(
                Icons.access_time,
                size: 20.sp,
                color: Colors.black,
              ),
              SizedBox(width: 5.w),
              Text(
                time,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
