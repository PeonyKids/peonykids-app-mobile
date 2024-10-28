import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../Styles/colors.dart';
import '../../Widgets/constants.dart';
import '../../Widgets/widgets.dart';
import '../../stateManagement/providers.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController _oldPasswordController = TextEditingController();
  TextEditingController _newPasswordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white04,
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: white), // Set the icon color to white
        elevation: 0,
        backgroundColor: white04,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: EdgeInsets.only(left: 15.w),
            child: Icon(
              Icons.arrow_back_ios,
              color: black,
            ),
          ),
        ),
        title: Text(
          'Change Password',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: black),
        ),
      ),
      body:Consumer<MainState>(
        builder: (context, value, child) {
          return SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Current Password',
                    style: TextStyle(
                        fontSize: 13, fontWeight: FontWeight.w400, color: black03),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _oldPasswordController,
                    cursorColor: black,
                    decoration: kTextFieldDecoration.copyWith(
                      filled: true,
                      fillColor: transparent,
                      focusColor: white,
                      hintText: '********',
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: black03,
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {},
                        child: Icon(
                          Icons.visibility_outlined,
                          color: black03,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'New Password',
                    style: TextStyle(
                        fontSize: 13, fontWeight: FontWeight.w400, color: black03),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _newPasswordController,
                    cursorColor: black,
                    obscuringCharacter: '*',
                    obscureText: true,
                    decoration: kTextFieldDecoration.copyWith(
                      filled: true,
                      fillColor: transparent,
                      focusColor: white,
                      hintText: '********',
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: black03,
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {},
                        child: Icon(
                          Icons.visibility_off_outlined,
                          color: black03,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Confirm New Password',
                    style: TextStyle(
                        fontSize: 13, fontWeight: FontWeight.w400, color: black03),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _confirmPasswordController,
                    cursorColor: black,
                    obscuringCharacter: '*',
                    obscureText: true,
                    decoration: kTextFieldDecoration.copyWith(
                      filled: true,
                      fillColor: transparent,
                      focusColor: white,
                      hintText: '********',
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: black03,
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {},
                        child: Icon(
                          Icons.visibility_off_outlined,
                          color: black03,
                        ),
                      ),
                    ),
                  ),
                 SizedBox(height: 10,),
                 Text(value.changePasswordError),
                  SizedBox(
                    height: 40,
                  ),
                  normalButton(onTap: () {
                    if(_oldPasswordController.text  !='' && _newPasswordController.text != '' && _confirmPasswordController.text != '') {

                      if(_confirmPasswordController.text.trim()  == _newPasswordController.text.trim()) {
                        value.oldPassword = _oldPasswordController.text.trim();
                        value.newPassword = _newPasswordController.text.trim();
                        value.ChangePasswords(context);
                      } else{
                        setState(() {
                          value.changePasswordError = 'Confirm password is not equal to New password.';
                        });
                      }
                    }  else {
                      setState(() {
                        value.changePasswordError = 'Fill in all inputs';
                      });
                    }
                  }, text: value.ChangePasswordState ? 'Saving...' : 'Save', color: value.ChangePasswordState ? primaryColor01.withOpacity(0.5): primaryColor01),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
