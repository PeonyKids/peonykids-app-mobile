import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Styles/colors.dart';


class OrdersCollection extends StatefulWidget {
  const OrdersCollection({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _OrdersCollectionState();
}

class _OrdersCollectionState extends State<OrdersCollection> {
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
            // scrollDirection: Axis.vertical,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15.w),
              child: Column(
                children: [
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: 7,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            SizedBox(
                              // height: 116,
                              child: Card(
                                surfaceTintColor: Colors.white,
                                elevation: 2,
                                shadowColor: Color(0xFF252525),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text('Order 8'),
                                          SizedBox(
                                            width: 15,
                                          ),
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
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('4 Items',
                                              style: TextStyle(
                                                  color: Color(0xFF737373))),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('See more',
                                                  style: TextStyle(
                                                      color:
                                                          Color(0xFF737373))),
                                              Icon(
                                                Icons.arrow_forward_ios,
                                                color: Color(0xFF737373),
                                                size: 20,
                                              )
                                            ],
                                          )
                                        ],
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
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            )
                          ],
                        );
                      }),
                ],
              ),
            ),
          )),
    );
  }
}
