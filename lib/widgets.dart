import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Styles/colors.dart';

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
        color: transparent.withOpacity(0.8),
        gradient: customGradient,
        boxShadow: [
          BoxShadow(
            color: primaryColor01.withOpacity(0.4), // Shadow color
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