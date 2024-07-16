import 'package:flutter/material.dart';
import 'package:peonyapp/Widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../../Styles/colors.dart';
import '../../stateManagement/providers.dart';

class forgotpasssword extends StatefulWidget {
  const forgotpasssword({super.key});

  @override
  State<forgotpasssword> createState() => _forgotpassswordState();
}

class _forgotpassswordState extends State<forgotpasssword> {
  TextEditingController _forgotEmailController = TextEditingController();
  @override

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
                    controller: _forgotEmailController,
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
                      height: 10,
                    ),
                Text(value.forgotPasswordError),
                    SizedBox(
                      height: 25,
                    ),
                     normalButton(onTap: (){
                       value.emails = _forgotEmailController.text.trim();
                       if(_forgotEmailController.text != '') {
                         value.forgotPassword();
                       } else {
                   setState(() {
                   value.forgotPasswordError = 'Fill in the input.';
                    });
                       }


                     }, text: value.ForgetPasswordState ? 'Sending Link...' : 'Send link', color: value.ForgetPasswordState ? primaryColor01.withOpacity(0.5): primaryColor01),
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
           ));
        }
      ),
    );
  }
}