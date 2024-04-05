import 'package:flutter/material.dart';

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
                      fontSize: 21,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Please follow the link that would be sent to your mail',
                    style: TextStyle(
                      color: Color(0xff737373),
                      fontWeight: FontWeight.w400,
                      fontSize: 21,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
               Text('Email',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20,fontFamily: 'WorkSans'),),
            SizedBox(height: 5,),
            TextField(
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
                SizedBox(
                  height: 35,
                ),
                 GestureDetector(
              onTap: () {
                
              },
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 15),
                height: 50,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xff64436E), Color(0xffE36E9A)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight),
                    borderRadius: BorderRadius.circular(25)),
                alignment: Alignment.center,
                child: Text(
                  'Send link',
                  style: TextStyle(color: Colors.white, fontFamily: 'WorkSans'),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Back',
                style: TextStyle(
                    color: Color(0xff64436E),
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal),
              ),
            )
          ],
               ),
       )),
    );
  }
}