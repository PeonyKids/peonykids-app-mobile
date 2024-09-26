import 'package:PeonyKids/Screens/Home/report.dart';
import 'package:PeonyKids/logic/childEvent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Models/childData.dart';
import '../../Styles/colors.dart';
import '../../Widgets/widgets.dart';
import '../../stateManagement/providers.dart';
import 'check-in.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

List<Map<String, dynamic>> items = [];
String parentName = '';

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
      end: 0.61,
    ).animate(_controller)
      ..addListener(() {
        setState(() {}); // Rebuild the widget when animation value changes
      });

    _controller.forward(); // Start the animation

    _initializeData();
  }

  Future<void> _initializeData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    parentName = '${prefs.getString('name')} ${prefs.getString('surname')}';
    // Create an instance of DataHandler
    Children childDataHandler =
        Children(Provider.of<MainState>(context, listen: false).childDetails);

    setState(() {
      items = childDataHandler.getProcessedData();
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the animation controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String name = '';

    return PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          // logic
        },
        child: Scaffold(
          backgroundColor: white,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Consumer<MainState>(builder: (context, value, child) {

                name = '${value.childFirstName} ${value.childLastName}';

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
                            fit: BoxFit
                                .fill, // Adjust this according to your needs
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 15.h, horizontal: 15.w),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                (name.trim().isEmpty)
                                                    ? parentName
                                                    : name,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              SizedBox(height: 8),
                                              Text(
                                                'PeonyKids Daycare School',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ],
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            print(name);
                                          },
                                          child: SvgPicture.asset(
                                            'assets/icons/Frame 9.svg',
                                            semanticsLabel: 'My SVG Image',
                                            height: 55.h,
                                            width: 55.w,
                                          ),
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
                                            style: BorderStyle.solid),
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
                                                      color:
                                                          primaryColor01, //<-- SEE HERE
                                                      backgroundColor: const Color(
                                                          0xffebfffd), //<-- SEE HERE
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
                                                child: SingleChildScrollView(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Pick Up Time - 1:00PM',
                                                        style: TextStyle(
                                                          fontSize: 16.sp,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: black,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Monday, 26 Feb. 2024',
                                                        style: TextStyle(
                                                          fontSize: 13.5.sp,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: black03,
                                                        ),
                                                      ),
                                                      Text(
                                                        'You have less than 4 hours left to pick up your child',
                                                        style: TextStyle(
                                                          fontSize: 13.5.sp,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: black,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
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
                                        Expanded(
                                          child: Column(
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
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      CheckIn()),
                                            );
                                          },
                                          child: Container(
                                            // height: 40,
                                            // width: 100,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              color: primaryColor01
                                                  .withOpacity(0.8),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8.0,
                                                      horizontal: 16.0),
                                              child: Center(
                                                child: Text(
                                                  'Check In',
                                                  style: TextStyle(
                                                      fontSize: 16.sp,
                                                      fontWeight:
                                                          FontWeight.w600,
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
                                      onTap: () {
                                        // print('I was selected');
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return CheckInDialog();
                                          },
                                        );
                                      },
                                      child: Container(
                                        // height: 50,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: transparent,
                                            border: Border.all(
                                                width: 0.3,
                                                color: black03,
                                                style: BorderStyle.solid)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                value.childFirstName,
                                                style: TextStyle(
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w600,
                                                    color: black),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Icon(
                                                Icons
                                                    .keyboard_arrow_down_rounded,
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
                                        Expanded(
                                          child: RichText(
                                            text: TextSpan(
                                              text: value.day,
                                              style: TextStyle(
                                                fontSize: 25.sp,
                                                fontWeight: FontWeight.w700,
                                                color: black,
                                              ),
                                              children: [
                                                WidgetSpan(
                                                  child: SizedBox(
                                                    width: 10.w,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: '${value.month} Activities',
                                                  style: TextStyle(
                                                    fontSize: 20.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color: black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            value.getChildReports(context);
                                            value.activeChild == null
                                                ? null
                                                : Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Reportpage()),
                                                  );
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              color: transparent,
                                              border: Border.all(
                                                width: 0.3,
                                                color: black03,
                                                style: BorderStyle.solid,
                                              ),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8.0,
                                                      horizontal: 12.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.analytics_outlined,
                                                    size: 30,
                                                    color: primaryColor01,
                                                  ),
                                                  SizedBox(width: 5),
                                                  Text(
                                                    'Child’s Report',
                                                    style: TextStyle(
                                                      fontSize: 16.sp,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: primaryColor01,
                                                    ),
                                                  ),
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
                                            color: black01.withOpacity(
                                                0.2), // Shadow color
                                            offset: Offset(
                                                0.0, 7.0), // Offset from right
                                            blurRadius:
                                                8, // Spread of the shadow
                                            spreadRadius: 0.0,
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 15.0, horizontal: 7.0),
                                        child:
                                            StreamBuilder<Map<String, dynamic>>(
                                          stream: value.fetchChildEventStream(),
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState ==
                                                ConnectionState.waiting) {
                                              return Center(child: CircularProgressIndicator(color: primaryColor01,));
                                            } else if (snapshot.hasError) {
                                              return Center(
                                                child: Text(
                                                    'No events available'),
                                              );
                                            } else if (snapshot.hasData) {
                                              final eventData = snapshot.data!;
                                              return buildEventReportColumn(
                                                  eventData, context);
                                            } else {
                                              return Center(child: Text('No data available'));
                                            }
                                          },
                                        ),
                                      ),
                                    ),
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
              }),
            ),
          ),
        ));
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

class CheckInDialog extends StatefulWidget {
  @override
  _CheckInDialogState createState() => _CheckInDialogState();
}

class _CheckInDialogState extends State<CheckInDialog> {
  // List<Map<String, dynamic>> items = [
  //   {'name': 'Macdonald', 'isChecked': false},
  //   {'name': 'Ben', 'isChecked': false},
  //   {'name': 'Anne', 'isChecked': false},
  // ];

  void _toggleChecked(int index, BuildContext context) {
    final changer = Provider.of<MainState>(context, listen: false);

    setState(() {
      for (int i = 0; i < items.length; i++) {
        items[i]['isChecked'] = i == index;

        if (items[i]['isChecked']) {
          changer.selectedChild(
              firstName: items[i]['firstName'],
              lastName: items[i]['lastName'],
              id: items[i]['id'],
              gender: items[i]['gender']);
          // Additional action
          changer.formatDateOfBirth(items[i]['dateOfBirth']);
          // Use formattedDate as needed

          changer.changeActiveChild(index);
        }
      }
    });
  }

  // void _toggleChecked(int index, BuildContext context) {
  //   final changer = Provider.of<MainState>(context, listen: false);
  //
  //   setState(() {
  //     for (int i = 0; i < items.length; i++) {
  //       items[i]['isChecked'] = i == index;
  //
  //       if (items[i]['isChecked']) {
  //         changer.selectedName(
  //           firstName: items[i]['firstName'],
  //           lastName: items[i]['lastName'],
  //         );
  //
  //         // Safely format the date of birth
  //         changer.formatDateOfBirth(items[i]['dateOfBirth']);
  //       }
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // // Create an instance of DataHandler
    // Children childDataHandler = Children();
    //
    // // Retrieve the processed data
    // List<Map<String, dynamic>> processedData = childDataHandler.getProcessedChildrenData();
    //
    // // // Use the processed data
    // print(processedData);

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      backgroundColor: white, // Adjust to the color you use for white
      actions: <Widget>[
        for (int i = 0; i < items.length; i++)
          _buildListItem(items[i]['firstName'], items[i]['isChecked'], i),
      ],
    );
  }

  Widget _buildListItem(String name, bool isChecked, int index) {
    return GestureDetector(
      onTap: () => _toggleChecked(index, context),
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: grey, // Adjust to the color you use for grey2
            ),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: black, // Adjust to the color you use for black
                ),
              ),
            ),
            isChecked
                ? Icon(
                    Icons.check_circle,
                    color: black,
                    size: 20,
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
