import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Styles/colors.dart';


class OrdersDetailsCollection extends StatefulWidget {
  const OrdersDetailsCollection({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _OrdersDetailsCollectionState();
}

class _OrdersDetailsCollectionState extends State<OrdersDetailsCollection> {
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
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Column(
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Row(
                          children: [
                            Image(
                              image: AssetImage('assets/images/image 5.png'),
                              width: 70,
                              height: 70,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('PJ Masks Children Hooded T-Shirt'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'N10,000',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  color: Color(0xFFEDEDED),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Date Ordered',
                      style: TextStyle(color: Color(0xFF737373), fontSize: 12),
                    ),
                    Row(
                      children: [
                        Text(
                          '21st March 2024',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Number of Items',
                      style: TextStyle(color: Color(0xFF737373), fontSize: 12),
                    ),
                    Row(
                      children: [
                        Text(
                          '1',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Delivery Method',
                      style: TextStyle(color: Color(0xFF737373), fontSize: 12),
                    ),
                    Row(
                      children: [
                        Text(
                          'Pick up at Peony',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Status',
                      style: TextStyle(color: Color(0xFF737373), fontSize: 12),
                    ),
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
                          style:
                              TextStyle(color: Color(0xFF737373), fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                    Row(
                      children: [
                        Text(
                          'N10,000',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
