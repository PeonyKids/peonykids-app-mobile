import 'package:flutter/material.dart';

import '../Styles/colors.dart';

// TextField(
// decoration: InputDecoration(
//
// prefixIcon: Icon(Icons.email,color: Color(0xff737373),),
// hintText: 'Enter your email address',
// hintStyle: TextStyle(color:  Color(0xff737373),fontFamily: 'WorkSans'),
// enabledBorder: OutlineInputBorder(
// borderSide: BorderSide(color: Color(0xffEDEDED)),
// borderRadius: BorderRadius.circular(10)
// ) ,
// focusedBorder: OutlineInputBorder(
// borderSide: BorderSide(color: Color(0xffEDEDED)),
// borderRadius: BorderRadius.circular(10),
//
// )
//
// ),
// ),

InputDecoration kTextFieldDecoration = InputDecoration(
  // hintText: 'A value',
  // hintStyle: kHintDisplayTextStyle,
  contentPadding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderSide: BorderSide(color: white03),
    borderRadius: const BorderRadius.all(
      Radius.circular(10.0),
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: white03),
    borderRadius: const BorderRadius.all(
      Radius.circular(10.0),
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: black,
      width: 1.0,
    ),
    borderRadius: const BorderRadius.all(
      Radius.circular(10.0),
    ),
  ),
  filled: true,
  fillColor: white,
  // focusColor: white
  // prefixIconColor: primaryColor,
  // iconColor: primaryColor,
);
