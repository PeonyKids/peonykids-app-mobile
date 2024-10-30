import 'package:PeonyKids/stateManagement/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Styles/colors.dart';
import '../../Widgets/widgets.dart';

class forgotpasssword extends StatefulWidget {
  const forgotpasssword({super.key});

  @override
  State<forgotpasssword> createState() => _forgotpassswordState();
}

class _forgotpassswordState extends State<forgotpasssword> {
  @override
  final TextEditingController _emailController = TextEditingController();


  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<MainState>(
        builder: (context, value, child) {
          return SafeArea(child:
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
                    controller: _emailController,
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
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false, // disable autocorrect
                  ),
                ),
                    SizedBox(
                      height: 35,
                    ),
                     normalButton(onTap: (){
                       if(_emailController.text != '') {
                         String Gmail = _emailController.text.trim();
                         value.forgotPassword(Gmail: Gmail);
                       }
                     }, text: 'Send link', color: primaryColor01),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Back',
                      style: TextStyle(color: black, fontFamily: 'WorkSans', fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                )
              ],
                   ),
           ));
        }
      ),
    );
  }
}