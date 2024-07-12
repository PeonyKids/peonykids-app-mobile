import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:peonyapp/Screens/Home/report.dart';
import 'package:peonyapp/stateManagement/providers.dart';
import 'package:provider/provider.dart';

import '../../Styles/colors.dart';
import 'check-in.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3), // Animation duration of 30 seconds
    );

    _animation = Tween<double>(
      begin: 0.0,
      end: 0.7,
    ).animate(_controller)
      ..addListener(() {
        setState(() {}); // Rebuild the widget when animation value changes
      });

    _controller.forward(); // Start the animation
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the animation controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    // 'Macdonald • Ben • Anne'

    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Consumer<MainState>(
            builder: (context, value, child) {

              String name = '${value.Name} ${value.Surname}';

              return Stack(
                children: [
                  ClipPath(
                    clipper: BottomClipper(),
                    child: Container(
                      width: double.infinity,
                      height: 250.h,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/headers.png'),
                          fit: BoxFit.fill, // Adjust this according to your needs
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 33.h),
                            child: Container(
                              decoration: BoxDecoration(color: transparent),
                              width: double.infinity,
                              // padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                       Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            name,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          SizedBox(height: 8),
                                          Text(
                                            'PeonyKids Daycare School',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                      SvgPicture.asset(
                                        'assets/icons/Frame 9.svg',
                                        semanticsLabel: 'My SVG Image',
                                        height: 55.h,
                                        width: 55.w,
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    height: 140,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                        color: primaryColor01,
                                        width: 1.0,
                                        style: BorderStyle.solid
                                      ),
                                        color: const Color(0xffe2ecd6),
                                    ),
                                    child: CustomPaint(
                                      painter: CustomCurvePainter(),
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Row(
                                          children: [
                                            Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                SizedBox(
                                                  height: 100,
                                                  width: 100,
                                                  child:
                                                      CircularProgressIndicator(
                                                    value: _animation.value,
                                                    strokeWidth: 13.0,
                                                    color: primaryColor01, //<-- SEE HERE
                                                    backgroundColor:
                                                        const Color(0xffebfffd), //<-- SEE HERE
                                                  ),
                                                ),
                                                Text(
                                                  '${(_animation.value * 100).toStringAsFixed(0)}%',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 24,
                                                      color: black),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Flexible(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text(
                                                    'Pick Up Time - 1:00PM',
                                                    style: TextStyle(
                                                        fontSize: 16.sp,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color:
                                                            black),
                                                  ),
                                                  Text(
                                                    'Monday, 26 Feb. 2024',
                                                    style: TextStyle(
                                                        fontSize: 13.5.sp,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: black03),
                                                  ),
                                                  Text(
                                                    'You have less than 4 hours left to pick up your child',
                                                    style: TextStyle(
                                                        fontSize: 13.5.sp,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color:
                                                            black),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            'Daily Check In/Out',
                                            style: TextStyle(
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w600,
                                                color: black),
                                          ),
                                          Text(
                                            'Check In by 8:00am required',
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w400,
                                                color: black),
                                          ),
                                        ],
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => CheckIn()),
                                          );
                                        },
                                        child: Container(
                                          // height: 40,
                                          // width: 100,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              color: primaryColor01.withOpacity(0.8),
                                              ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8.0, horizontal: 16.0),
                                            child: Center(
                                              child: Text(
                                                'Check In',
                                                style: TextStyle(
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.w600,
                                                    color: white),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Divider(
                                    // height: 12,
                                    color: black03,
                                    thickness: 0.3,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      print('I was selected');

                                    },
                                    child: Container(
                                      // height: 50,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          color: transparent,
                                          border: Border.all(
                                              width: 0.3,
                                              color: black03,
                                              style: BorderStyle.solid)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Macdonald',
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: black),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              size: 35,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          text: "26",
                                          style: TextStyle(
                                              fontSize: 25.sp,
                                              fontWeight: FontWeight.w700,
                                              color: black),
                                          children: [
                                            WidgetSpan(
                                              child: SizedBox(
                                                width: 10.w,
                                              ),
                                            ),
                                            TextSpan(
                                              text: 'Feb Activities',
                                              style: TextStyle(
                                                  fontSize: 20.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: black),
                                            )
                                          ],
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Reportpage()),
                                          );
                                        },
                                        child: Container(
                                          // height: 40,
                                          // width: 100,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              color: transparent,
                                              border: Border.all(
                                                  width: 0.3,
                                                  color: black03,
                                                  style: BorderStyle.solid)),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8.0, horizontal: 12.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.analytics_outlined,
                                                  size: 30,
                                                  color: primaryColor01,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  'Child’s Report',
                                                  style: TextStyle(
                                                      fontSize: 16.sp,
                                                      fontWeight: FontWeight.w600,
                                                      color: primaryColor01),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color: black01
                                                .withOpacity(0.2), // Shadow color
                                            offset: Offset(
                                                0.0, 7.0), // Offset from right
                                            blurRadius: 8, // Spread of the shadow
                                            spreadRadius: 0.0,
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 15.0, horizontal: 7.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            tracker(
                                                type: 'assets/icons/CheckIn.svg',
                                                head: 'Check In Time',
                                                time: '8:00am'),
                                            tracker(
                                                type: 'assets/icons/Physical Acts.svg',
                                                head: 'Physical Activities',
                                                time: '9:00am',
                                                subhead: 'Rhymes and Dance',
                                                subhead2: 'Toy Sorting'),
                                            tracker(
                                                type: 'assets/icons/Diaper Time.svg',
                                                head: 'Diaper Time',
                                                time: '11:00am'),
                                            tracker(
                                                type: 'assets/icons/MealTime.svg',
                                                head: 'Meal Time',
                                                time: '12:00pm',
                                                subhead: 'Golden Morn & Milk'),
                                            tracker(
                                                type: 'assets/icons/Nap Time.svg',
                                                head: 'Nap Time',
                                                time: '12:30pm'),
                                            tracker(
                                                type: 'assets/icons/PlayTime.svg',
                                                head: 'Play Time',
                                                time: '1:30pm'),
                                            tracker(
                                                type: 'assets/icons/ArtsCrafts.svg',
                                                head: 'Arts and Craft',
                                                time: '2:30pm'),
                                            tracker(
                                                type: 'assets/icons/MealTime.svg',
                                                head: 'Snack Time',
                                                time: '3:00pm',
                                                subhead: 'Cabin Biscuit',
                                                subhead2: 'Juice'),
                                            tracker(
                                                type: 'assets/icons/BookTime.svg',
                                                head: 'Story Time',
                                                time: '4:00pm'),
                                          ],
                                        ),
                                      )),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
          ),
        ),
      ),
    );
  }

  tracker(
      {required String type,
      required String head,
      required String time,
      String? subhead,
      String? subhead2}) {
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
          Padding(
            padding: EdgeInsets.only(top: 5.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  head,
                  style:
                      TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w600),
                ),
                subhead != null
                    ? Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          subhead,
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.w400),
                        ),
                      )
                    : Container(),
                subhead2 != null
                    ? Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          subhead2,
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.w400),
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
          Expanded(
            child: SizedBox(width: 25.w),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5.h),
            child: Row(
              children: [
                Icon(
                  Icons.access_time,
                  size: 20.sp,
                  color: black,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  time,
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class BottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final double cornerRadius = 70.0; // Adjust the corner radius as needed

    // Move to the bottom-left corner
    path.moveTo(0, size.height - cornerRadius);

    // Draw a quadratic Bezier curve to the bottom-right corner
    path.quadraticBezierTo(0, size.height, cornerRadius, size.height);

    // Draw an arc to simulate the curved bottom-right corner
    path.arcToPoint(
      Offset(size.width - cornerRadius, size.height),
      radius: Radius.circular(cornerRadius),
      clockwise: false,
    );

    // Draw a quadratic Bezier curve to the bottom-left corner
    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height - cornerRadius);

    // Draw a straight line to the top-right corner
    path.lineTo(size.width, 0);

    // Draw a straight line to the top-left corner
    path.lineTo(0, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false; // Since our clipper is not dependent on any parameters, we return false here
  }
}

class CustomCurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color(0xffdeebce) // Change the color as needed
      ..style = PaintingStyle.fill;

    Path path = Path()
      ..moveTo(0, 0) // Starting point at top-left corner
      ..lineTo(
          size.width * 0.33, 0) // Move horizontally to 35% of container width
      ..quadraticBezierTo(
        size.width *
            0.8, // Control point X coordinate (midpoint of the container)
        size.height *
            0.35, // Control point Y coordinate (35% of container height)
        size.width, // Endpoint X coordinate (right edge of the container)
        size.height * 0.21, // Endpoint Y coordinate (35% of container height)
      )
      ..lineTo(size.width,
          size.height * 0.70) // Draw a straight line to the new point
      ..quadraticBezierTo(
        size.width *
            0.5, // Control point X coordinate (midpoint of the container)
        size.height *
            1.2, // Control point Y coordinate (75% of container height)
        0, // Endpoint X coordinate (left edge of the container)
        size.height * 0.55,
      ) // Endpoint Y coordinate (25% of container height)
      ..lineTo(0, 0); // Move back to the starting point

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
