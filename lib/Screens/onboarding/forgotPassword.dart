import 'package:flutter/material.dart';

import '../../Styles/colors.dart';
import '../../Widgets/widgets.dart';

class forgotpasssword extends StatefulWidget {
  const forgotpasssword({super.key});

  @override
  State<forgotpasssword> createState() => _forgotpassswordState();
}

class _forgotpassswordState extends State<forgotpasssword> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child:
       Padding(
         padding: const EdgeInsets.all(16.0),
         child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             SizedBox(
                  height: 20,
                ),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Forgot Password?',
                style: TextStyle(
                  color: Color(0xff252525),
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Please follow the link that would be sent to your mail',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff737373),
                fontWeight: FontWeight.w400,
                fontSize: 17,
                fontStyle: FontStyle.normal,
              ),
            ),

                SizedBox(
                  height: 30,
                ),
               Text('Email',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16,fontFamily: 'WorkSans'),),
            SizedBox(height: 5,),
            SizedBox(
              height: 60,
              child: TextField(
                decoration: InputDecoration(

                  prefixIcon: Icon(Icons.email,color: Color(0xff737373),),
                  hintText: 'Enter your email address',
                  hintStyle: TextStyle(color:  Color(0xff737373),fontFamily: 'WorkSans'),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffEDEDED)),
                    borderRadius: BorderRadius.circular(10)
                  ) ,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffEDEDED)),
                    borderRadius: BorderRadius.circular(10),

                  )

                ),
              ),
            ),
                SizedBox(
                  height: 35,
                ),
                 normalButton(onTap: (){

                 }, text: 'Send link', color: primaryColor01),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Back',
                style: TextStyle(color: black, fontFamily: 'WorkSans', fontSize: 16, fontWeight: FontWeight.w600),
              ),
            )
          ],
               ),
       )),
    );
  }
}