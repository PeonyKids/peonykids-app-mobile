

import 'package:flutter/material.dart';

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
                  child:    Column(
                    children: [
                      Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Notification'),
                                    Text(
                                      'Clear all',
                                      style: TextStyle(decoration: TextDecoration.underline),
                                    )
                                  ],
                                ),
                      SizedBox(height: 10),
                      Text(
                        'Here are some daily updates regarding your child',
                        style: TextStyle(color: Color(0xFF737373)),
                      ),
                      SizedBox(height: 15),
                      Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: Image(image: AssetImage('lib/images/no-noti.png')),
                            
                          ))
                    ],

                  ),

          )
      ),
    );
  }
}
