import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Styles/colors.dart';
import '../../accountsreens/createaccount.dart';
import '../../accountsreens/login.dart';
import '../../widgets.dart';

class OnboardOneScreen extends StatefulWidget {
  const OnboardOneScreen({Key? key}) : super(key: key);

  @override
  State<OnboardOneScreen> createState() => _OnboardOneScreenState();
}

class _OnboardOneScreenState extends State<OnboardOneScreen> {
  late PageController _pageController;
  // late int indexes;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    startTimer();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void startTimer() {
    Timer.periodic(const Duration(seconds: 10), (timer) {
      _currentIndex = (_currentIndex + 1) % imageList.length;
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  List<String> imageList = [
    'assets/images/splashscreen1.png',
    'assets/images/Wormies Social Media.png',
    'assets/images/Wormies Outdoors.png'
  ];

  List<String> textList = [
    'We believe that young \nminds have no limits or\nboundaries',
    'We have the best set of \nhands to look after the \nchildren',
    'We incorporate art \nexperiences into our daily \nroutines'
  ];

  @override
  Widget build(BuildContext context) {
    int indexes = _currentIndex;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            // height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: SizedBox(
                      height: 50,
                      width: 150,
                      child: Image.asset('assets/images/peonychildcare.png')),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Center(
                  child: Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: primaryColor01
                              .withOpacity(0.1), // Decreased opacity
                          spreadRadius: 0.5, // Spread radius
                          blurRadius: 30, // Decreased blur radius
                          offset: Offset(0, 0), // Offset // Offset
                        ),
                      ],
                    ),
                    child: Center(
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: imageList.length,
                        onPageChanged: (index) {
                          setState(() {
                            _currentIndex = index;

                            indexes = _currentIndex;
                          });
                          // print(_currentIndex);
                        },
                        itemBuilder: (context, index) {
                          return AnimatedSwitcher(
                            duration: Duration(milliseconds: 500),
                            child: _currentIndex == index
                                ? Image.asset(
                                    imageList[index],
                                    key: ValueKey<int>(_currentIndex),
                                    height: 280,
                                    width: 280,
                                  )
                                : const SizedBox.shrink(),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Text(
                  textList[indexes],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 23, fontWeight: FontWeight.w600, height: 1.2),
                ),
                SizedBox(
                  height: 50.h,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: indexes == 0 ? primaryColor01 : grey,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: indexes == 1 ? primaryColor01 : grey,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: indexes == 2 ? primaryColor01 : grey,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                // SizedBox(
                //   height: 50,
                //   width: double.infinity,
                //   child: Container(
                //     decoration: BoxDecoration(
                //         color: primaryColor01,
                //         borderRadius: BorderRadius.circular(25)),
                //     child: ElevatedButton(
                //         style: ElevatedButton.styleFrom(
                //             elevation: 0,
                //             backgroundColor: transparent,
                //             shape: RoundedRectangleBorder(
                //                 borderRadius: BorderRadius.circular(25)),
                //             splashFactory: NoSplash.splashFactory,
                //         ),
                //         onPressed: (() {
                //           // Navigator.pushNamed(context, '/infoOnePage');
                //           //
                //           // Navigator.push(context, route)
                //
                //           Navigator.push(
                //             context,
                //             MaterialPageRoute(
                //                 builder: (context) => createaccount()),
                //           );
                //         }),
                //         child: Text('Sign Up',
                //             style: TextStyle(
                //                 color: white,
                //                 fontWeight: FontWeight.w600,
                //                 fontSize: 14))),
                //   ),
                // ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => createaccount()),
                    );
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: primaryColor01,
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
                      child: Text('Sign Up',
                          style: TextStyle(
                              color: white,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),)
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: MyOutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => login()),
                      );
                    },
                    gradient: customGradient01,
                    style: ElevatedButton.styleFrom(
                        splashFactory: NoSplash.splashFactory),
                    child: Text(
                      'Log in',
                      style: TextStyle(
                          color: primaryColor01,
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                // Padding(
                //   padding: const EdgeInsets.fromLTRB(0, 100, 0, 20),
                //   child: Text(
                //     'By signing up, you agree to our Terms & Condition. See how we use your data in our Privacy Policy ',
                //     textAlign: TextAlign.center,
                //     style: GoogleFonts.poppins(
                //         fontSize: 13, fontWeight: FontWeight.w500),
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
