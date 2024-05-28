import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Styles/colors.dart';
import '../payment/payment.dart';
import '../widgets.dart';

class particluaritem extends StatefulWidget {
  const particluaritem({super.key});

  @override
  State<particluaritem> createState() => _particluaritemState();
}

class _particluaritemState extends State<particluaritem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFDFCFD),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 16.0),
            child: Column(
            children: [
              SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   Icon(Icons.arrow_back_ios_new_outlined,size: 23,),
                    Row(
                      children: [
                       Image(image: AssetImage('assets/images/Frame 6.png')),
                        SizedBox(width: 10,),
                        Image(image: AssetImage('assets/images/Frame 7.png'))
                      ],
                    )
                  ],
                ),
                SizedBox(height: 10,),
                Image(image: AssetImage('assets/images/image 6.png'),width: double.infinity,fit: BoxFit.fill,),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Danami Children's Zip Up Hoodie",style: TextStyle(fontWeight: FontWeight.bold),),
                      Text('N20,000',style: TextStyle(fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
                SizedBox(height: 5,),
                Row(
                  children: [
                    Icon(Icons.location_on_outlined,color: Color(0xFF252525),),
                    SizedBox(width: 5,),
                    Text('Lekki Phase 2, Lagos. Nigeria',style: TextStyle(color: Color(0xFF252525)),)
                  ],
                ),
                 Row(
                  children: [
                    Icon(Icons.motorcycle_outlined,color: Color(0xFF252525),),
                    SizedBox(width: 5,),
                    Text('Pick up available',style: TextStyle(color: Color(0xFF252525)),)
                  ],
                             ),
                 SizedBox(height: 10,),
                 Padding(
                   padding: const EdgeInsets.symmetric(vertical: 10.0),
                   child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Colors',style: TextStyle(color: Color(0xFF000000),fontWeight: FontWeight.bold),),
                       SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(backgroundColor: white02,),
                          SizedBox(width: 10,),
                            CircleAvatar(backgroundColor: Colors.grey,),
                             SizedBox(width: 10,),
                              CircleAvatar(backgroundColor: Colors.grey,),
                               SizedBox(width: 10,),
                                CircleAvatar(backgroundColor: Colors.grey,)
                        ],
                      )
                    ],
                   ),
                 ),
                  SizedBox(height: 10,),
                 Padding(
                   padding: const EdgeInsets.symmetric(vertical: 10.0),
                   child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text('About',style: TextStyle(color: Color(0xFF000000),fontWeight: FontWeight.bold),)),
                       SizedBox(height: 10,),
                    Text('Suitable for kids from 2-12months')
                    ],
                   ),
                 ),
                 SizedBox(height: 10,),
              GestureDetector(
                onTap: (){
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => createaccount()),
                  // );
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
                      child: Text('Add to Cart',
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
                      MaterialPageRoute(builder: (context) => payments()),
                    );
                  },
                  gradient: customGradient01,
                  style: ElevatedButton.styleFrom(
                      splashFactory: NoSplash.splashFactory),
                  child: Text(
                    'Check out',
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
            ],
                  ),
          ),
        )),
    );
  }
}