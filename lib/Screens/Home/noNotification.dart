import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class nonotification extends StatefulWidget {
  const nonotification({Key? key}) : super(key: key);

  @override
  State<nonotification> createState() => _nonotificationState();
}

class _nonotificationState extends State<nonotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Notification',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      'Clear all',
                      style: TextStyle(decoration: TextDecoration.underline),
                    )
                  ],
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: 300.w,
                  child: Text(
                    'Here are some daily updates regarding your child',
                    style: TextStyle(color: Color(0xFF737373)),
                  ),
                ),
                SizedBox(height: 15),
                Expanded(
                    child: Container(
                  alignment: Alignment.center,
                  child: Image(image: AssetImage('assets/images/no-noti.png',), height: 180, width: 180,),
                ))
              ],
            ),
          )),
    );
  }
}
