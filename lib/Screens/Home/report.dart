import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../Styles/colors.dart';

class Reportpage extends StatefulWidget {
  const Reportpage({Key? key}) : super(key: key);

  @override
  State<Reportpage> createState() => _ReportpageState();
}

class _ReportpageState extends State<Reportpage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      childSelector(active: true, name: 'Macdonald'),
      childSelector(active: false, name: 'Ben'),
      childSelector(active: false, name: 'Anne'),
      childSelector(active: false, name: 'John'),
    ];

    return Scaffold(
      backgroundColor: white04,
      appBar: AppBar(
        iconTheme: IconThemeData(color: white04), // Set the icon color to white
        elevation: 0,
        backgroundColor: white,
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
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15.w),
            child: Icon(
              Icons.info_outline,
              color: black,
            ),
          ),
        ],
        title: Center(
          child: Text(
            'Child’s daily report',
            style: TextStyle(
                fontSize: 17, fontWeight: FontWeight.w600, color: black),
          ),
        ),
      ),
      body: SafeArea(
        child: PageView.builder(
            itemCount: children.length, // Number of items in the list
          itemBuilder: (context, index) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(top: 10, left: 15.w, right: 15.w),
                child: Column(
                  children: [
                    Center(
                      child: SizedBox(
                        height: 50,
                        width: children.isEmpty
                            ? 0.0
                            : children.length.toDouble() * 120,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: children.length, // Number of items in the list
                          itemBuilder: (context, index) {
                            return children[index];
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: IntrinsicWidth(
                            child: Container(
                              height: 40,
                              // width: 200,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: black,
                                  ),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '23rd February, 2024',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: black),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_down,
                                    size: 30,
                                    color: black,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Macdonald demonstrated a high level of interest and enthusiasm in our art & craft activities today. Well done darling',
                          style: TextStyle(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w400,
                              color: black),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Mood',
                          style: TextStyle(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w600,
                              color: black),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Wrap(
                          spacing: 10.0,
                          runSpacing: 10.0,
                          children: [
                            moods(
                              mood: true,
                              emoji: 'assets/icons/cil_happy.svg',
                              text: 'Happy',
                            ),
                            moods(
                              mood: false,
                              emoji: 'assets/icons/carbon_face-neutral.svg',
                              text: 'Chunky',
                            ),
                            moods(
                              mood: false,
                              emoji: 'assets/icons/formkit_sad.svg',
                              text: 'Sad',
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.only(right: 10, bottom: 15),
                            //   child: Container(
                            //     height: 45,
                            //     width: 150,
                            //     decoration: BoxDecoration(
                            //         borderRadius: BorderRadius.circular(50),
                            //         color: purplish,
                            //         border: Border.all(
                            //             width: 1.0,
                            //             color: primaryColor01,
                            //             style: BorderStyle.solid)),
                            //     child: Padding(
                            //       padding: const EdgeInsets.all(10.0),
                            //       child: Row(
                            //         // mainAxisAlignment: MainAxisAlignment.center,
                            //         children: [
                            //           SvgPicture.asset(
                            //             'assets/icons/cil_happy.svg',
                            //             semanticsLabel: 'My SVG Image',
                            //             height: 23,
                            //             width: 23,
                            //             color: primaryColor01,
                            //           ),
                            //           SizedBox(
                            //             width: 5,
                            //           ),
                            //           Text(
                            //             'Happy',
                            //             style: TextStyle(
                            //                 fontSize: 16,
                            //                 fontWeight: FontWeight.w400,
                            //                 color: primaryColor01),
                            //           ),
                            //           Expanded(
                            //             child: SizedBox(
                            //               width: 5,
                            //             ),
                            //           ),
                            //           Icon(
                            //             Icons.check_circle,
                            //             size: 22,
                            //             color: primaryColor01,
                            //           )
                            //         ],
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            activity(
                              acts: 'assets/icons/Frame 33.svg',
                              text: 'Meals',
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: black02.withOpacity(0.1), // Shadow color
                                    offset: Offset(0.0, 7.0), // Offset from right
                                    blurRadius: 12, // Spread of the shadow
                                    spreadRadius: 0.0,
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 15, left: 15, right: 15, bottom: 30),
                                child: Column(
                                  children: [
                                    order(
                                        time: 'Time',
                                        header1: 'Meal',
                                        header2: 'Quantity'),
                                    Table(
                                      children: [
                                        details(
                                            time: '10:38am',
                                            info: 'Cereal',
                                            info2: 'All'),
                                        details(
                                            time: '12:40pm',
                                            info: 'Rice',
                                            info2: 'All'),
                                        details(
                                            time: '02:50pm',
                                            info: 'Snack & Juice',
                                            info2: 'All'),
                                        details(
                                            time: '04:00pm',
                                            info: 'Juice',
                                            info2: 'All'),
                                      ],
                                    ),
                                    // details(
                                    //     time: '10:38am',
                                    //     info: 'Cereal',
                                    //     info2: 'All'),
                                    // details(
                                    //     time: '12:40pm',
                                    //     info: 'Rice',
                                    //     info2: 'All'),
                                    // details(
                                    //     time: '02:50pm',
                                    //     info: 'Snack & Juice',
                                    //     info2: 'All'),
                                    // details(
                                    //     time: '04:00pm',
                                    //     info: 'Juice',
                                    //     info2: 'All'),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                          ],
                        ),
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            activity(
                              acts: 'assets/icons/Frame 32.svg',
                              text: 'Nap Time',
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: black02.withOpacity(0.1), // Shadow color
                                    offset: Offset(0.0, 7.0), // Offset from right
                                    blurRadius: 12, // Spread of the shadow
                                    spreadRadius: 0.0,
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: 15, left: 15, right: 15, bottom: 30),
                                child: Column(
                                  children: [
                                    order(
                                        time: 'Time',
                                        header1: 'Wake up Time',
                                        header2: 'Comments'),
                                    Table(
                                      children: [
                                        details(
                                            time: '01:35pm',
                                            info: '02:30pm',
                                            info2: '-'),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                          ],
                        ),
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            activity(
                              acts: 'assets/icons/Frame 32-1.svg',
                              text: 'Diaper Time',
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: black02.withOpacity(0.1), // Shadow color
                                    offset: Offset(0.0, 7.0), // Offset from right
                                    blurRadius: 12, // Spread of the shadow
                                    spreadRadius: 0.0,
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: 15, left: 15, right: 15, bottom: 30),
                                child: Column(
                                  children: [
                                    order(
                                        time: 'Time',
                                        header1: 'Diaper',
                                        header2: 'Potty'),
                                    Table(
                                      children: [
                                        details(
                                            time: '03:37pm',
                                            info: 'Wet',
                                            info2: '-'),
                                        details(
                                            time: '04:05pm',
                                            info: 'Wet',
                                            info2: '-'),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: transparent,
                                  border: Border.all(
                                      width: 1.0,
                                      color: primaryColor01,
                                      style: BorderStyle.solid)),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.file_download_outlined,
                                      size: 35,
                                      color: primaryColor01,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Download PDF',
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w600,
                                          color: primaryColor01),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          }
        ),
      ),
    );
  }

  TableRow details(
      {required String time, required String info, required String info2}) {
    return TableRow(children: [
      Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: black,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            time,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w500, color: black),
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: black,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            info,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w500, color: black),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: black,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            info2,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w500, color: black),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    ]);
  }

  Row activity({required String acts, required String text}) {
    return Row(
      children: [
        SvgPicture.asset(
          acts,
          semanticsLabel: 'My SVG Image',
          height: 50.h,
          width: 50.w,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          text,
          style: TextStyle(
              fontSize: 17.sp, fontWeight: FontWeight.w600, color: black),
        ),
      ],
    );
  }

  Container order(
      {required String time,
      required String header1,
      required String header2}) {
    return Container(
      // height: 30,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: lightest,
      ),
      child: Table(
        children: [
          TableRow(children: [
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  time,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500, color: black),
                ),
              ),
            ),
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  header1,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500, color: black),
                ),
              ),
            ),
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  header2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500, color: black),
                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }

  // Container details(
  //     {required String time, required String info, required String info2}) {
  //   return Container(
  //     height: 50,
  //     width: double.infinity,
  //     decoration: BoxDecoration(
  //       border: Border(
  //         bottom: BorderSide(
  //           color: black,
  //         ),
  //       ),
  //     ),
  //     padding: const EdgeInsets.symmetric(
  //       horizontal: 15,
  //     ),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         Text(
  //           time,
  //           style: TextStyle(
  //               fontSize: 16, fontWeight: FontWeight.w500, color: black),
  //         ),
  //         // Expanded(
  //         //   child: SizedBox(
  //         //     width: 15.0,
  //         //   ),
  //         // ),
  //         Text(
  //           info,
  //           style: TextStyle(
  //               fontSize: 16, fontWeight: FontWeight.w500, color: black),
  //         ),
  //         // Expanded(
  //         //   child: SizedBox(
  //         //     width: 15.0,
  //         //   ),
  //         // ),
  //         Text(
  //           info2,
  //           style: TextStyle(
  //               fontSize: 16, fontWeight: FontWeight.w500, color: black),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  moods({required bool mood, required String emoji, required String text}) {
    return IntrinsicWidth(
      child: Container(
        height: 50,
        // width: mood ? 150 : 110,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: mood ? lightish : transparent,
            border: Border.all(
                width: 1.0,
                color: mood ? primaryColor01 : black,
                style: BorderStyle.solid)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                emoji,
                semanticsLabel: 'My SVG Image',
                height: 23,
                width: 23,
                color: mood ? primaryColor01 : black,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                text,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: mood ? primaryColor01 : black),
              ),
              Visibility(
                visible: mood,
                child: Expanded(
                  child: SizedBox(
                    width: 5,
                  ),
                ),
              ),
              Visibility(
                visible: mood,
                child: Icon(
                  Icons.check_circle,
                  size: 22,
                  color: primaryColor01,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container childSelector({required bool active, required String name}) {
    return Container(
      height: 70,
      width: 120,
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
        color: active ? primaryColor01 : black,
        width: active ? 3.0 : 1.0,
      ))),
      child: Center(
        child: Text(
          name,
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: active ? primaryColor01 : black),
        ),
      ),
    );
  }

}
