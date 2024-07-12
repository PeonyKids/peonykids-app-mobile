import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:peonyapp/stateManagement/providers.dart';
import 'package:peonyapp/Widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../../Styles/colors.dart';
import 'enterYourChildDetails.dart';

class otp extends StatefulWidget {
  const otp({super.key});

  @override
  State<otp> createState() => _otpState();
}

class _otpState extends State<otp> {
  TextEditingController _onecontroller = TextEditingController();
  TextEditingController _twocontroller = TextEditingController();
  TextEditingController _threecontroller = TextEditingController();
  TextEditingController _fourcontroller = TextEditingController();
  TextEditingController _fivecontroller = TextEditingController();
  TextEditingController _sixcontroller = TextEditingController();


  FocusNode fNodeOne = FocusNode();
  FocusNode fNodeTwo = FocusNode();
  FocusNode fNodeThree = FocusNode();
  FocusNode fNodeFour = FocusNode();
  FocusNode fNodeFive = FocusNode();
  FocusNode fNodeSix = FocusNode();

  Color borderColor = Color(0xff737373);
  Color borderColorTwo = Color(0xff737373);
  Color borderColorThree = Color(0xff737373);
  Color borderColorFour = Color(0xff737373);
  Color borderColorFive = Color(0xff737373);
  Color borderColorSix = Color(0xff737373);
  double borderWidthOne = 2;
  double borderWidthTwo = 2;
  double borderWidthThree = 2;
  double borderWidthFour = 2;
  double borderWidthFive = 2;
  double borderWidthSix = 2;


  String name = 'hi';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<MainState>(
        builder: (context, value, child) {
          return Builder(
            builder: (context) {
              return SafeArea(
                  top: true,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
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
                        Text(
                          'An OTP was sent to ${value.emailController}, please enter the code you found there',
                          style: TextStyle(
                              color: Color(0xff737373),
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400),
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
                                controller: _onecontroller,
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
                                controller: _twocontroller,
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
                                controller: _threecontroller,
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
                                controller: _fourcontroller,
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
                                controller: _fivecontroller,
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
                                    FocusScope.of(context).requestFocus(fNodeSix);
                                    setState(() {
                                      borderColor = Color(0xff737373);
                                      borderColorSix = Color(0xff64436E);
                                      borderColorThree = Color(0xff737373);
                                      borderColorFive = Color(0xff737373);
                                      borderColorFour = Color(0xff737373);
                                      borderColorTwo = Color(0xff737373);
                                      borderWidthOne = 2;
                                      borderWidthTwo = 2;
                                      borderWidthThree = 2;
                                      borderWidthFour = 2;
                                      borderWidthFive = 2;
                                      borderWidthSix = 4;
                                    });
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
                            SizedBox(
                              width: 50,
                              child: TextField(
                                controller: _sixcontroller,
                                focusNode: fNodeSix,
                                maxLength: 1,
                                onTap: () {
                                  fNodeSix.hasFocus
                                      ? setState(() {
                                    borderColorSix = Color(0xff64436E);
                                    borderColor = Color(0xff737373);
                                    borderColorTwo = Color(0xff737373);
                                    borderColorThree = Color(0xff737373);
                                    borderColorFour = Color(0xff737373);
                                    borderColorFive = Color(0xff737373);
                                    borderWidthOne = 2;
                                    borderWidthTwo = 2;
                                    borderWidthThree = 2;
                                    borderWidthFour = 2;
                                    borderWidthFive = 2;
                                    borderWidthSix = 4;
                                  })
                                      : setState(() {
                                    borderColorSix = Color(0xff737373);
                                  });
                                },
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    // FocusScope.of(context).requestFocus(fNodeOne);
                                  } else {
                                    FocusScope.of(context).requestFocus(fNodeFive);
                                    setState(() {
                                      borderColor = Color(0xff737373);
                                      borderColorFive = Color(0xff64436E);
                                      borderColorTwo = Color(0xff737373);
                                      borderColorThree = Color(0xff737373);
                                      borderColorFive = Color(0xff737373);
                                      borderColorSix = Color(0xff737373);
                                      borderWidthOne = 2;
                                      borderWidthTwo = 2;
                                      borderWidthThree = 2;
                                      borderWidthFour = 2;
                                      borderWidthFive = 4;
                                      borderWidthSix = 2;
                                    });
                                  }
                                },
                                decoration: InputDecoration(
                                    counterText: '',
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: borderColorSix,
                                            width: borderWidthSix)),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: borderColorSix,
                                            width: borderWidthSix))),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30,),
                        Text(value.statusVerifyPhone, style: TextStyle(
                          color: Colors.red
                          ),
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        Align(
                            alignment: Alignment.topLeft,
                            child: GestureDetector(
                              onTap: (){
                                value.resendLoginOTP(context);
                              },
                              child: Text(
                                "Didn't receive an email? Resend Email",
                                style: TextStyle(color: Colors.black, decoration: TextDecoration.underline),
                              ),
                            )),
                        SizedBox(
                          height: 25,
                        ),
                        shadowButton(onTap: (){
                          value.verifyPhone = _onecontroller.text.trim() + _twocontroller.text.trim() + _threecontroller.text.trim() + _fourcontroller.text.trim() + _fivecontroller.text.trim() + _sixcontroller.text.trim();
                          //Navigator.push(
                          //////  context,
                           // MaterialPageRoute(builder: (context) => childdetails()),
                          //);
                          value.verifyOtp(context);
                        }, text: 'Continue', color: primaryColor01),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: (){
                             // value.verifyEmail();
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Back',
                            style: TextStyle(
                                color: primaryColor01, fontWeight: FontWeight.w600, fontSize: 16),
                          ),
                        )
                      ],
                    ),
                  ));
            }
          );
        }
      ),
    );
  }
}
