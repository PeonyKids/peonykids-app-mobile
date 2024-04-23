import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Styles/colors.dart';

class orders extends StatefulWidget {
  const orders({Key? key}) : super(key: key);

  @override
  State<orders> createState() => _ordersState();
}

class _ordersState extends State<orders> {
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
          'My Orders',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: black),
        ),
      ),
      body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15.w),
              child: Column(
                children: [
                  ListView.builder(
                    itemCount: 14,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      surfaceTintColor: Colors.white,
                                      content: IntrinsicHeight(
                                        child: SizedBox(
                                          child: Column(
                                            children: [
                                              Text('Product Details'),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Image(
                                                image: AssetImage(
                                                    'assets/images/image 5.png'),
                                                width: 90,
                                                height: 90,
                                              ),
                                              Text(
                                                  'PJ Masks Children Hooded T-Shirt'),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Status',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFF737373),
                                                        fontSize: 12),
                                                  ),
                                                  Row(
                                                    children: [
                                                      CircleAvatar(
                                                        backgroundColor:
                                                            Color(0xFFE36E9A),
                                                        radius: 5,
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(
                                                        'Delivered',
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xFF737373),
                                                            fontSize: 12),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Number of Items',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFF737373),
                                                        fontSize: 12),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        '1',
                                                        style: TextStyle(
                                                            fontSize: 12),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Date Ordered',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFF737373),
                                                        fontSize: 12),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        '21st March 2024',
                                                        style: TextStyle(
                                                            fontSize: 12),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Delivery Method',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFF737373),
                                                        fontSize: 12),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'Pick up at Peony',
                                                        style: TextStyle(
                                                            fontSize: 12),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Total',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'N10,000',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              SizedBox(
                                                width: double.infinity,
                                                child: ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            elevation: 0,
                                                            shape:
                                                                StadiumBorder(),
                                                            backgroundColor:
                                                                Color(
                                                                    0xFFF6F2F7)),
                                                    onPressed: () {},
                                                    child: Text(
                                                      'Done',
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xFF64436E),
                                                          fontSize: 14),
                                                    )),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ));
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image(
                                image: AssetImage('assets/images/image 5.png'),
                                width: 60,
                                height: 60,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'PJ Masks Children Hooded T-Shirt',
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      'N10,000',
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Image(
                                          image: AssetImage(
                                              'assets/images/motor.png'),
                                          width: 10,
                                          height: 10,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'Pick up at Peony',
                                          style: TextStyle(
                                              color: Color(0xFF64436E)),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: Color(0xFFE36E9A),
                                          radius: 5,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'Delivered',
                                          style: TextStyle(
                                              color: Color(0xFF737373)),
                                        ),
                                      ],
                                    ),
                                  ])
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
