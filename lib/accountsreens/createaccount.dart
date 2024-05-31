import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:peonyapp/accountsreens/securityQuestions.dart';
import 'package:peonyapp/accountsreens/weSentAnOtp.dart';
import 'package:peonyapp/widgets.dart';

import '../Styles/colors.dart';
import 'package:provider/provider.dart';


import '../stateManagement/providers.dart';

class createaccount extends StatefulWidget {
  const createaccount({super.key});

  @override
  State<createaccount> createState() => _createaccountState();
}

class _createaccountState extends State<createaccount> {
  String errorInput = '';
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'Create an account',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: black),
        ),
      ),
      body: SafeArea(
          child: Consumer<MainState>(builder: (context, value, child){
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Email',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          fontFamily: 'WorkSans'),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 60,
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: Color(0xff737373),
                            ),
                            hintText: 'Enter your email address',
                            hintStyle: TextStyle(
                                color: Color(0xff737373), fontFamily: 'WorkSans'),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xffEDEDED)),
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffEDEDED)),
                              borderRadius: BorderRadius.circular(10),
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Password',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          fontFamily: 'WorkSans'),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 60,
                      child: TextField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock_outlined, color: Color(0xff737373)),
                            suffixIcon: Icon(Icons.visibility_outlined, color: Color(0xff737373)),
                            hintText: 'Enter your password',
                            hintStyle: TextStyle(
                                color: Color(0xff737373), fontFamily: 'WorkSans'),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xffEDEDED)),
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xffEDEDED)),
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Retype Password',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          fontFamily: 'WorkSans'),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 60,
                      child: TextField(
                        controller: _confirmPasswordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock_outlined, color: Color(0xff737373)),
                            suffixIcon: Icon(Icons.visibility_outlined, color: Color(0xff737373)),
                            hintText: 'Retype your passwod',
                            hintStyle: TextStyle(
                                color: Color(0xff737373), fontFamily: 'WorkSans'),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xffEDEDED)),
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xffEDEDED)),
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    SizedBox(height: 10,),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'FirstName',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          fontFamily: 'WorkSans'),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 60,
                      child: TextField(
                        controller: _firstNameController,
                        obscureText: true,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person, color: Color(0xff737373)),

                            hintText: 'FirstName',
                            hintStyle: TextStyle(
                                color: Color(0xff737373), fontFamily: 'WorkSans'),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xffEDEDED)),
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xffEDEDED)),
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'LastName',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          fontFamily: 'WorkSans'),
                    ),
                    SizedBox(height: 5,),
                    SizedBox(
                      height: 60,
                      child: TextField(
                        controller: _lastNameController,
                        obscureText: true,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person, color: Color(0xff737373)),

                            hintText: 'LastName',
                            hintStyle: TextStyle(
                                color: Color(0xff737373), fontFamily: 'WorkSans'),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xffEDEDED)),
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xffEDEDED)),
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Phone Number',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          fontFamily: 'WorkSans'),
                    ),
                    SizedBox(height: 5,),
                    SizedBox(
                      height: 60,
                      child: TextField(
                        controller: _numberController,
                        obscureText: true,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.phone, color: Color(0xff737373)),

                            hintText: 'Phone Number',
                            hintStyle: TextStyle(
                                color: Color(0xff737373), fontFamily: 'WorkSans'),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xffEDEDED)),
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xffEDEDED)),
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),


                    Text(errorInput),
                    SizedBox(
                      height: 30,
                    ),
                    shadowButton(onTap: (){
                      if(_emailController.text !='' && _passwordController.text != '' && _confirmPasswordController.text != '' && _lastNameController.text != '' && _firstNameController.text != '' && _numberController.text != '' ){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => securityquestions()),
                        );
                        value.verifyEmail();
                      } else{
                        setState(() {
                          errorInput  = 'Fill in all inputs';
                        });

                      }
                      value.emailController = _emailController.text.trim();
                      value.passwordController = _passwordController.text.trim();
                      value.confirmController = _confirmPasswordController.text.trim();
                      value.firstName = _firstNameController.text.trim();
                      value.lastName = _lastNameController.text.trim();
                      value.phone  = _numberController.text.trim();


                    }, text: 'Next'),

                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "You already an account?",
                          style: TextStyle(color: black03),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Login',
                          style: TextStyle(
                              color: primaryColor01, fontWeight: FontWeight.bold,  fontSize: 15),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          }

          )),
    );
  }
}
