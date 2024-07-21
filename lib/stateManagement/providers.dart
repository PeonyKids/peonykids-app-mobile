import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';

import 'package:flutter/material.dart';
import 'package:peonyapp/Screens/Home/homepage.dart';
import 'package:peonyapp/Screens/onboarding/enterYourChildDetails.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../Models/childData.dart';
import '../Screens/bottomnavigationbar/bottomnavigationbar.dart';
import '../Screens/onboarding/congratulations.dart';
import '../Screens/onboarding/login.dart';
import '../Screens/onboarding/weSentAnOtp.dart';



class MainState extends ChangeNotifier {
  String error = '';
  String emailController = '';
  String passwordController = '';
  String confirmController = '';
  String securityQuestion = '';
  String securityAnswer ='';
  String firstName = '';
  String lastName = '';
  String phone = '';
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


  String childName = '';

  void selectedName(String name){
    childName = name;
    Name = name;
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


    final Map<String, dynamic> registrationData = json.decode(response.body);

    if (registrationData['success'] == 'true') {


     //  Navigator.push(
     //    context,
     //    MaterialPageRoute(builder: (context) => congratulations()),
     //  );
     //  print(registrationData);
     //  print('User signed up successfully');
     // SignInUser(false);


      // LoggingIn(false);

      SigningInError(true);
      // print('Failed to sign up user: ${response.body}');

      // LoggingIn(false);
      print(registrationData);
      error = registrationData['message'];

      verifyEmail();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => login()),
      );

      print(error);
      Future.delayed(const Duration(seconds: 15) ,() => SigningInError(false));
      SignInUser(false);

    } else {
      SigningInError(true);
      print('Failed to sign up user: ${response.body}');
      // LoggingIn(false);
      print(registrationData);
      error = registrationData['message'];
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

  Future<void> resendLoginOTP(BuildContext context) async {
    final url = Uri.parse(
        'https://seahorse-app-9ubkt.ondigitalocean.app/api/v1/auth/resend-verify-login-otp/$Gmail');
    // print('hi');
    final response = await post(
      url,
      headers: {
        'Accept': '*/*',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {


      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => bottomnavigationbar()),
      // ) ;
      //  statusVerifyPhone = registrationData['message'];
      print(response.body);

      print('email sent successfully');
      notifyListeners();
    } else {
      print('Failed to send email: ${response.body}');
      final Map<String, dynamic> responseBody = json.decode(response.body);

      print(responseBody['message']);
      // statusVerifyPhone = registrationData['message'];
      // print(error);
      notifyListeners();
    }
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



      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => bottomnavigationbar()),
      // ) ;

      statusVerifyPhone = registrationData['message'];

      print(registrationData);

      fetchChild(context);

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


  // String token= '';
  String userToken = '';
  String Name = '';
  String Surname = '';
  String Gmail = '';
  String PhoneNumber = '';
  String userId = '';


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

      SharedPreferences prefs = await SharedPreferences.getInstance();


      print(loginData);
      print('Logged in successfully');

      prefs.setString('userToken', loginData['jwtToken']);
      prefs.setString('name', loginData['data']['firstName']);
      prefs.setString('surname', loginData['data']['lastName']);
      prefs.setString('number', loginData['data']['phoneNumber']);
      prefs.setString('gmail', loginData['data']['email']);
      prefs.setString('userId', loginData['data']['id'].toString());

      userToken = prefs.getString('userToken')!;
      Name = prefs.getString('name')!;
      Surname = prefs.getString('surname')!;
      Gmail = prefs.getString('gmail')!;
      PhoneNumber = prefs.getString('number')!;
      userId = prefs.getString('userId')!;


      successUser = loginData['success'].toString();
      successUser == 'true' ? Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => otp()),
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
        userToken = '';
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


  Future<void> AddChild(BuildContext context) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();

    final url = Uri.parse(
      'https://seahorse-app-9ubkt.ondigitalocean.app/api/v1/parent/$userId/add-child',
    );

    // late Response response;

    for (var child in Child.Childs) {
      final response = await post(
        url,
        headers: {
          'Accept': '*/*',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $userToken',
        },
        body: jsonEncode({
          'firstname': child['firstname'],
          'lastname': child['lastname'],
          'gender': child['gender']
        }),
      );



      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        try {
          print('Status: ${response.statusCode}');
          // print('Child added Successfully');
          print(responseData["message"]);
        } catch (e) {
          // Handle the plain text response
          print('Ran into Error adding Child Details');
        }
      } else {
        print('Child addition Unsuccessful');
        print(response.statusCode);
      }
      notifyListeners();
    }
  }


  Future<void> fetchChild(BuildContext context) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();

    final url = Uri.parse(
      'https://seahorse-app-9ubkt.ondigitalocean.app/api/v1/parent/$userId/children',
    );

      // late Response response;

      final response = await get(
        url,
        headers: {
          'Accept': '*/*',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $userToken',
        }
      );



      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        try {
          print('Status: ${response.statusCode}');
          // print('Child added Successfully');
          print(responseData);

          if (responseData.isEmpty){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChildDetails()),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => bottomnavigationbar()),
            );
          }

        } catch (e) {
          // Handle the plain text response
          print('Ran into Error adding Child Details');
        }
      } else {
        print('Child fetching Unsuccessful');
        print(response.statusCode);
      }
      notifyListeners();
  }
}
