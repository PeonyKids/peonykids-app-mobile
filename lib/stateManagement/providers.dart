import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';

import 'package:flutter/material.dart';
import 'package:peonyapp/accountsreens/weSentAnOtp.dart';

import '../accountsreens/congratulations.dart';

class MainState extends ChangeNotifier {
  String error = '';
  String emailController = 'kazeemquayum67@gmail.com';
  String passwordController = 'Nooooooo30#';
  String confirmController = 'Nooooooo304#';
  String securityQuestion = 'whats your name';
  String securityAnswer ='kazeem';
  String firstName = 'kazeem';
  String lastName = 'quayum';
  String phone = '+2348109713456';
  String verifyPhone = '';
  String statusVerifyPhone = '';
  bool SignInError = false;
  bool LogInState = false;
  String success = '';

  void LoggingIn(bool Login) {
   LogInState = Login;
    notifyListeners();
  }

  void SignInUser(bool verifying) {
  SignInError = verifying;
    notifyListeners();
  }

  Future<void> signUpUser(BuildContext context) async {
    final url = Uri.parse(
        'https://seahorse-app-9ubkt.ondigitalocean.app/api/v1/users/sign-up');
    print('hi');
    LoggingIn(true);
    final response = await post(
      url,
      headers: {
        'Accept': '*/*',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "email": emailController,
        "password": passwordController,
        "firstName": firstName,
        "lastName": lastName,
        "confirmPassword": confirmController,
        "phoneNumber": phone,
        // Ensure this matches the required format
        "securityQuestion": securityQuestion,
        "securityAnswer": securityAnswer,
        "role": "USER"
      }),
    );


    if (response.statusCode == 200) {
      final Map<String, dynamic> registrationData = json.decode(response.body);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => congratulations()),
      ) ;
      print(registrationData);
      print('User signed up successfully');
     SignInUser(false);
      LoggingIn(false);
    } else {
      print('Failed to sign up user: ${response.body}');
      final Map<String, dynamic> registrationData = json.decode(response.body);
      LoggingIn(false);
      print(registrationData);
      error = registrationData['message'];
      success = registrationData['success'].toString();
      success == 'true' ? Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => otp()),
      )  : null;
      success == 'true' ?
      verifyEmail()  : null;
      print(error);
     SignInUser(true);
    }
    notifyListeners();
  }

  Future<void> verifyEmail() async {
    final url = Uri.parse(
        'https://seahorse-app-9ubkt.ondigitalocean.app/api/v1/auth/resend-verify-login-otp/$emailController');
    print('hi');
    final response = await post(
      url,
      headers: {
        'Accept': '*/*',
        'Content-Type': 'application/json',
      },

    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> registrationData = json.decode(response.body);

      print(registrationData);
      print('email sent successfully');
    } else {
      print('Failed to sign up user: ${response.body}');
      final Map<String, dynamic> registrationData = json.decode(response.body);

      print(registrationData);
      error = registrationData['message'];
      print(error);
    }
    notifyListeners();
  }

  Future<void> verifyOtp(BuildContext context) async {
    final url = Uri.parse(
        'https://seahorse-app-9ubkt.ondigitalocean.app/api/v1/auth/verify-login/$verifyPhone');
    print('hi');
    final response = await post(
      url,
      headers: {
        'Accept': '*/*',
        'Content-Type': 'application/json',
      },

    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> registrationData = json.decode(response.body);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => congratulations()),
      ) ;
    //  statusVerifyPhone = registrationData['message'];
      print(registrationData);
      print('email sent successfully');
      notifyListeners();
    } else {
      print('Failed to sign up user: ${response.body}');
      final Map<String, dynamic> registrationData = json.decode(response.body);

      print(registrationData);
      statusVerifyPhone = registrationData['message'];
      print(error);
      notifyListeners();
    }
  }

}
