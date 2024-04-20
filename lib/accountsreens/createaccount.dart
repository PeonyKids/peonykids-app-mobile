import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class createaccount extends StatefulWidget {
  const createaccount({super.key});

  @override
  State<createaccount> createState() => _createaccountState();
}

class _createaccountState extends State<createaccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: 
      SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(height: 10,),
                  Icon(Icons.arrow_back_ios),
                  SizedBox(width: 70,),
                  Text('Create an account',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23,fontFamily: 'WorkSans'),)
                ],
              ),
              SizedBox(height: 20,),
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
               SizedBox(height: 20,),
              Text('Password',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20,fontFamily: 'WorkSans'),),
              SizedBox(height: 5,),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock,color: Color(0xff737373)),
                  suffixIcon: Icon(Icons.visibility,color: Color(0xff737373)),
                  hintText: 'Enter your password',
                  hintStyle: TextStyle(color:  Color(0xff737373),fontFamily: 'WorkSans'),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffEDEDED)),
                    borderRadius: BorderRadius.circular(10)
                  ) ,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffEDEDED)),
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
              ),
               SizedBox(height: 20,),
              Text('Retype Password',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20,fontFamily: 'WorkSans'),),
              SizedBox(height: 5,),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.visibility_off,color: Color(0xff737373)),

                  prefixIcon: Icon(Icons.email,color: Color(0xff737373),),
                  hintText: 'Retype your passwod',
                  hintStyle: TextStyle(color:  Color(0xff737373),fontFamily: 'WorkSans'),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffEDEDED)),
                    borderRadius: BorderRadius.circular(10)
                  ) ,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffEDEDED)),
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
              ),
              SizedBox(height: 30,),
             GestureDetector(
               onTap: ()
    {
       Navigator.pushNamed(context, '/weSentAnOtp');
    },


               child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Color(0xff64436E), Color(0xffE36E9A)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight
                  ),
                  borderRadius: BorderRadius.circular(25)
                ),
                alignment: Alignment.center,
                child: Text('Next',style: TextStyle(color: Colors.white,fontFamily: 'WorkSans'),),
               ),
             )
            ],
          ),
        ),
      )),
    );
  }
}