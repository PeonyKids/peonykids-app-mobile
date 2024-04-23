import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'enterYourChildDetails.dart';

class otp extends StatefulWidget {
  const otp({super.key});

  @override
  State<otp> createState() => _otpState();
}

class _otpState extends State<otp> {
  TextEditingController _controller = TextEditingController();
  FocusNode fNodeOne = FocusNode();
  FocusNode fNodeTwo = FocusNode();
  FocusNode fNodeThree = FocusNode();
  FocusNode fNodeFour = FocusNode();
  FocusNode fNodeFive = FocusNode();
  Color borderColor = Color(0xff737373);
  Color borderColorTwo = Color(0xff737373);
  Color borderColorThree = Color(0xff737373);
  Color borderColorFour = Color(0xff737373);
  Color borderColorFive = Color(0xff737373);
  double borderWidthOne = 2;
  double borderWidthTwo = 2;
  double borderWidthThree = 2;
  double borderWidthFour = 2;
  double borderWidthFive = 2;

  String name = 'hi';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          top: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'We sent an OTP',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 21,
                  fontStyle: FontStyle.normal,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'An OTP was sent to macthedesigner@gmail.com, please enter the code you found there',
                  style: TextStyle(
                      color: Color(0xff737373),
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 50,
                    child: TextField(
                      controller: _controller,
                      maxLength: 1,
                      focusNode: fNodeFive,
                      onTap: () {
                        fNodeFive.hasFocus
                            ? setState(() {
                                borderColor = Color(0xff64436E);
                                borderColorTwo = Color(0xff737373);
                                borderColorThree = Color(0xff737373);
                                borderColorFour = Color(0xff737373);
                                borderColorFive = Color(0xff737373);
                                borderWidthOne = 4;
                                borderWidthTwo = 2;
                                borderWidthThree = 2;
                                borderWidthFour = 2;
                                borderWidthFive = 2;
                              })
                            : borderColor = Color(0xff737373);
                      },
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).requestFocus(fNodeTwo);
                          setState(() {
                            borderColor = Color(0xff737373);
                            borderColorTwo = Color(0xff64436E);
                            borderColorThree = Color(0xff737373);
                            borderColorFour = Color(0xff737373);
                            borderColorFive = Color(0xff737373);
                            borderWidthOne = 2;
                            borderWidthTwo = 4;
                            borderWidthThree = 2;
                            borderWidthFour = 2;
                            borderWidthFive = 2;
                          });
                        }
                      },
                      decoration: InputDecoration(
                          counterText: '',
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: borderColor, width: borderWidthOne)),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: borderColor, width: borderWidthOne))),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                    child: TextField(
                      focusNode: fNodeTwo,
                      maxLength: 1,
                      onTap: () {
                        fNodeTwo.hasFocus
                            ? setState(() {
                                borderColorTwo = Color(0xff64436E);
                                borderColor = Color(0xff737373);
                                borderColorFour = Color(0xff64436E);
                                borderColorThree = Color(0xff737373);
                                borderColorFive = Color(0xff737373);
                                borderWidthOne = 2;
                                borderWidthTwo = 4;
                                borderWidthThree = 2;
                                borderWidthFour = 2;
                                borderWidthFive = 2;
                              })
                            : setState(() {
                                borderColorTwo = Color(0xff737373);
                              });
                      },
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).requestFocus(fNodeThree);
                          setState(() {
                            borderColor = Color(0xff737373);
                            borderColorThree = Color(0xff64436E);
                            borderColorTwo = Color(0xff737373);
                            borderColorFour = Color(0xff737373);
                            borderColorFive = Color(0xff737373);
                            borderWidthTwo = 2;
                            borderWidthOne = 2;
                            borderWidthThree = 4;
                            borderWidthFour = 2;
                            borderWidthFive = 2;
                          });
                        } else {
                          FocusScope.of(context).requestFocus(fNodeFive);
                          setState(() {
                            borderColorThree = Color(0xff737373);
                            borderColor = Color(0xff64436E);
                            borderColorTwo = Color(0xff737373);
                            borderColorFour = Color(0xff737373);
                            borderColorFive = Color(0xff737373);
                            borderWidthOne = 4;
                            borderWidthTwo = 2;
                            borderWidthThree = 2;
                            borderWidthFour = 2;
                            borderWidthFive = 2;
                          });
                        }
                      },
                      decoration: InputDecoration(
                          counterText: '',
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: borderColorTwo,
                                  width: borderWidthTwo)),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: borderColorTwo,
                                  width: borderWidthTwo))),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                    child: TextField(
                      focusNode: fNodeThree,
                      maxLength: 1,
                      onTap: () {
                        fNodeThree.hasFocus
                            ? setState(() {
                                borderColorThree = Color(0xff64436E);
                                borderColor = Color(0xff737373);
                                borderColorTwo = Color(0xff737373);
                                borderColorFour = Color(0xff737373);
                                borderColorFive = Color(0xff737373);

                                borderWidthOne = 2;
                                borderWidthTwo = 2;
                                borderWidthThree = 4;
                                borderWidthFour = 2;
                                borderWidthFive = 2;
                              })
                            : setState(() {
                                borderColorThree = Color(0xff737373);
                              });
                      },
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).requestFocus(fNodeFour);
                          setState(() {
                            borderColor = Color(0xff737373);
                            borderColorFour = Color(0xff64436E);
                            borderColorThree = Color(0xff737373);
                            borderColorTwo = Color(0xff737373);
                            borderColorFive = Color(0xff737373);
                            borderWidthOne = 2;
                            borderWidthTwo = 2;
                            borderWidthThree = 2;
                            borderWidthFour = 4;
                            borderWidthFive = 2;
                          });
                        } else {
                          FocusScope.of(context).requestFocus(fNodeTwo);
                          setState(() {
                            borderColor = Color(0xff737373);
                            borderColorTwo = Color(0xff64436E);
                            borderColorThree = Color(0xff737373);
                            borderColorFour = Color(0xff737373);
                            borderColorFive = Color(0xff737373);
                            borderWidthOne = 2;
                            borderWidthTwo = 4;
                            borderWidthThree = 2;
                            borderWidthFour = 2;
                            borderWidthFive = 2;
                          });
                        }
                      },
                      decoration: InputDecoration(
                          counterText: '',
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: borderColorThree,
                                  width: borderWidthThree)),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: borderColorThree,
                                  width: borderWidthThree))),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                    child: TextField(
                      focusNode: fNodeFour,
                      maxLength: 1,
                      onTap: () {
                        fNodeFour.hasFocus
                            ? setState(() {
                                borderColorFour = Color(0xff64436E);
                                borderColor = Color(0xff737373);
                                borderColorTwo = Color(0xff737373);
                                borderColorThree = Color(0xff737373);
                                borderColorFive = Color(0xff737373);
                                borderWidthOne = 2;
                                borderWidthTwo = 2;
                                borderWidthThree = 2;
                                borderWidthFour = 4;
                                borderWidthFive = 2;
                              })
                            : setState(() {
                                borderColorFour = Color(0xff737373);
                              });
                      },
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).requestFocus(fNodeOne);
                          setState(() {
                            borderColor = Color(0xff737373);
                            borderColorFive = Color(0xff64436E);
                            borderColorThree = Color(0xff737373);
                            borderColorFour = Color(0xff737373);
                            borderColorTwo = Color(0xff737373);
                            borderWidthOne = 2;
                            borderWidthTwo = 2;
                            borderWidthThree = 2;
                            borderWidthFour = 2;
                            borderWidthFive = 4;
                          });
                        } else {
                          FocusScope.of(context).requestFocus(fNodeThree);
                          setState(() {
                            borderColor = Color(0xff737373);
                            borderColorThree = Color(0xff64436E);
                            borderColorTwo = Color(0xff737373);
                            borderColorFour = Color(0xff737373);
                            borderColorFive = Color(0xff737373);
                            borderWidthOne = 2;
                            borderWidthTwo = 2;
                            borderWidthThree = 4;
                            borderWidthFour = 2;
                            borderWidthFive = 2;
                          });
                        }
                      },
                      decoration: InputDecoration(
                          counterText: '',
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: borderColorFour,
                                  width: borderWidthFour)),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: borderColorFour,
                                  width: borderWidthFour))),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                    child: TextField(
                      focusNode: fNodeOne,
                      maxLength: 1,
                      onTap: () {
                        fNodeOne.hasFocus
                            ? setState(() {
                                borderColorFive = Color(0xff64436E);
                                borderColor = Color(0xff737373);
                                borderColorTwo = Color(0xff737373);
                                borderColorThree = Color(0xff737373);
                                borderColorFour = Color(0xff737373);
                                borderWidthOne = 2;
                                borderWidthTwo = 2;
                                borderWidthThree = 2;
                                borderWidthFour = 2;
                                borderWidthFive = 4;
                              })
                            : setState(() {
                                borderColorFive = Color(0xff737373);
                              });
                      },
                      onChanged: (value) {
                        if (value.length == 1) {
                          // FocusScope.of(context).requestFocus(fNodeOne);
                        } else {
                          FocusScope.of(context).requestFocus(fNodeFour);
                          setState(() {
                            borderColor = Color(0xff737373);
                            borderColorFour = Color(0xff64436E);
                            borderColorTwo = Color(0xff737373);
                            borderColorThree = Color(0xff737373);
                            borderColorFive = Color(0xff737373);
                            borderWidthOne = 2;
                            borderWidthTwo = 2;
                            borderWidthThree = 2;
                            borderWidthFour = 4;
                            borderWidthFive = 2;
                          });
                        }
                      },
                      decoration: InputDecoration(
                          counterText: '',
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: borderColorFive,
                                  width: borderWidthFive)),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: borderColorFive,
                                  width: borderWidthFive))),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Didn't receive an email?",
                      style: TextStyle(color: Colors.black),
                    )),
              ),
              SizedBox(
                height: 25,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => childdetails()),
                  );
                },
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  height: 50,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xff64436E), Color(0xffE36E9A)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight),
                      borderRadius: BorderRadius.circular(25)),
                  alignment: Alignment.center,
                  child: Text(
                    'Continue',
                    style:
                        TextStyle(color: Colors.white, fontFamily: 'WorkSans'),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Back',
                style: TextStyle(
                    color: Color(0xff64436E), fontWeight: FontWeight.w600),
              )
            ],
          )),
    );
  }
}
