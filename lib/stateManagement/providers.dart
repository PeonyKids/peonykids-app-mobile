import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';

import 'package:flutter/material.dart';
import 'package:peonyapp/Screens/Home/homepage.dart';
import 'package:peonyapp/accountsreens/login.dart';
import 'package:peonyapp/accountsreens/weSentAnOtp.dart';
import 'package:peonyapp/bottomnavigationbar/bottomnavigationbar.dart';
import 'package:shared_preferences/shared_preferences.dart';


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
  bool SignInState = false;
  String success = '';
  String loginUserName = '';
  String passwordUserName = '';
  String successUser = '';
  String errorLogin = '';
  String token= '';
  String userTokens = '';

  void LoggingIn(bool Login) {
   LogInState = Login;
    notifyListeners();
  }

  void SignInUser(bool verifying) {
  SignInState = verifying;
    notifyListeners();
  }

  void SigningInError(bool verifying) {
    SignInError = verifying;
    notifyListeners();
  }

  Future<void> signUpUser(BuildContext context) async {

    SignInUser(true);

    final url = Uri.parse(
        'https://seahorse-app-9ubkt.ondigitalocean.app/api/v1/users/sign-up');
    print('hi');
    // LoggingIn(true);
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
      );
      print(registrationData);
      print('User signed up successfully');
     SignInUser(false);
      // LoggingIn(false);
    } else {
      SigningInError(true);
      print('Failed to sign up user: ${response.body}');
      final Map<String, dynamic> registrationData = json.decode(response.body);
      // LoggingIn(false);
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
      Future.delayed(const Duration(seconds: 15) ,() => SigningInError(false));
     SignInUser(false);
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


  String Name = '';
  String Surname = '';
  String Gmail = '';
  String PhoneNumber = '';


  // bool isLoading = false;
  //
  // void loader() {
  //   isLoading = !isLoading;
  //   notifyListeners();
  // }


  Future<void> LoginUser(BuildContext context) async {

    LoggingIn(true);

    final url = Uri.parse(
        'https://seahorse-app-9ubkt.ondigitalocean.app/api/v1/auth/login');


    final response = await post(
      url,
      headers: {
        'Accept': '*/*',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "email": loginUserName,
        "password": passwordUserName,

      }),
    );


    final Map<String, dynamic> loginData = json.decode(response.body);

    if (response.statusCode == 200) {

      print('Status: ${response.statusCode}');
     token = loginData['jwtToken'];

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('userToken', token);
      userTokens = prefs.getString('userToken')!;

      print(loginData);
      print('Logged in successfully');

      prefs.setString('name', loginData['data']['firstName']);
      prefs.setString('surname', loginData['data']['lastName']);
      prefs.setString('number', loginData['data']['phoneNumber']);
      prefs.setString('gmail', loginData['data']['email']);

     Name = prefs.getString('name')!;
     Surname = prefs.getString('surname')!;
     Gmail = prefs.getString('gmail')!;
     PhoneNumber = prefs.getString('number')!;

      successUser = loginData['success'].toString();
      successUser == 'true' ? Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => bottomnavigationbar()),
      )  : null;

      LoggingIn(false);

    } else {
      print('Status: ${response.statusCode}');
      print('Wrong user details: ${response.body}');
      loginData['message'] == "Cannot invoke \"java.time.temporal.Temporal.until(java.time.temporal.Temporal, java.time.temporal.TemporalUnit)\" because \"temporal1Inclusive\" is null" || loginData['message'] == 'Invalid username or password' ? errorLogin = 'Invalid username or password' : errorLogin = loginData['message'];

      LoggingIn(false);

      print(errorLogin);
    }
    notifyListeners();
  }


  Future<void> LogoutUser(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String mail = prefs.getString('gmail')!;
    final url = Uri.parse(
      'https://seahorse-app-9ubkt.ondigitalocean.app/api/v1/auth/logout/$mail',
    );

    final response = await post(
      url,
      headers: {
        'Accept': '*/*',
        'Content-Type': 'application/json',
      }
    );

    // final Map<String, dynamic> logoutData = json.decode(response.body);
    if (response.statusCode == 200) {
      try {
        // final Map<String, dynamic> logoutData = json.decode(response.body);
        // Handle the JSON response
        print('Status: ${response.statusCode}');
        print('Logout Successful');


        // print(logoutData);

        // Clear user data from shared preferences
        await prefs.remove('userToken');
        await prefs.remove('name');
        await prefs.remove('surname');
        await prefs.remove('number');
        await prefs.remove('gmail');

        // Clear variables
        token = '';
        userTokens = '';
        Name = '';
        Surname = '';
        Gmail = '';
        PhoneNumber = '';

        // Navigate to login or home screen
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => login()), // Replace with your login screen
              (Route<dynamic> route) => false,
        );
      } catch (e) {
        // Handle the plain text response
        print('Logout Partly Successful');
        // print(response.body); // e.g., 'Logout Successful'
      }
    } else {
      print('Logout Unsuccessful');
      // print('Status: ${response.statusCode}');
      // print('Failed to logout: ${response.body}');
      // String errorLogout = response.body;
      // print(errorLogout);
    }
    // if (response.statusCode == 200) {
    //   print('Status: ${response.statusCode}');
    //   print('Logout Successful');
    //
    //
    //   print(logoutData);
    //
    //   // Clear user data from shared preferences
    //   await prefs.remove('userToken');
    //   await prefs.remove('name');
    //   await prefs.remove('surname');
    //   await prefs.remove('number');
    //   await prefs.remove('gmail');
    //
    //   // Clear variables
    //   token = '';
    //   userTokens = '';
    //   Name = '';
    //   Surname = '';
    //   Gmail = '';
    //   PhoneNumber = '';
    //
    //   // Navigate to login or home screen
    //   Navigator.pushAndRemoveUntil(
    //     context,
    //     MaterialPageRoute(builder: (context) => login()), // Replace with your login screen
    //         (Route<dynamic> route) => false,
    //   );
    // } else {
    //   print('Status: ${response.statusCode}');
    //   print('Failed to logout: ${response.body}');
    //   String errorLogout = logoutData['message'];
    //   print(errorLogout);
    // }
    notifyListeners();
  }

}
