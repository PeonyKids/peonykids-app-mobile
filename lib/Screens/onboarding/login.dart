import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:peonyapp/Widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../../Styles/colors.dart';
import '../../stateManagement/providers.dart';
import 'forgotPassword.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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
            padding: EdgeInsets.only(left: 10.w),
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: black,
            ),
          ),
        ),
        title: Text(
          'Welcome Back',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: black01),
        ),
      ),
      body: SafeArea(
          child: Consumer<MainState>(
              builder: (context, value, child) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20,),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: 60,
                        child: TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                color: Color(0xff737373),
                              ),
                              hintText: 'Enter your email address',
                              hintStyle: TextStyle(
                                  color: Color(0xff737373), fontFamily: 'WorkSans'),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xffEDEDED)),
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xffEDEDED)),
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Password',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20,),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: 60,
                        child: TextField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock_outlined, color: Color(0xff737373)),
                              suffixIcon: Icon(Icons.visibility_outlined, color: Color(0xff737373)),
                              hintText: 'Enter your password',
                              hintStyle: TextStyle(
                                  color: Color(0xff737373), fontFamily: 'WorkSans'),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xffEDEDED)),
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xffEDEDED)),
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text(value.errorLogin, style: TextStyle(color: red),),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => forgotpasssword()),
                            );
                          },
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,),
                          )),
                      SizedBox(
                        height: 50,
                      ),
                      normalButton(onTap: (){

                       
                        value.loginUserName = _emailController.text.trim();
                        value.passwordUserName = _passwordController.text.trim();
                        if(_emailController.text != '' && _passwordController.text != '') {
                          value.LoginUser(context);

                        } else {
                          setState(() {
                            value.errorLogin = 'Please Fill In All Inputs';
                          });

                        }
                        //    Navigator.push(
                        //    context,
                        //   MaterialPageRoute(
                        //     builder: (context) => bottomnavigationbar()),
                        // );
                      }, text: value.LogInState ? 'Continue...' : 'Continue', color: value.LogInState ? primaryColor01.withOpacity(0.5): primaryColor01),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: TextStyle(color: black03),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Sign up',
                            style: TextStyle(
                                color: primaryColor01, fontWeight: FontWeight.bold,  fontSize: 15),
                          )
                        ],
                      )
                    ],
                  ),
                );
              }
          )),
    );
  }


}
