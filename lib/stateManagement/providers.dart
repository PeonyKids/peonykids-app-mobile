import 'dart:convert';
import 'package:http/http.dart';

import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
// import 'package:uuid/uuid.dart';

import '../Models/childData.dart';
import '../Models/errorHandle.dart';
import '../Screens/Account/changePassword.dart';
import '../Screens/Home/homepage.dart';
import '../Screens/bottomnavigationbar/bottomnavigationbar.dart';
import '../Screens/onboarding/congratulations.dart';
import '../Screens/onboarding/enterYourChildDetails.dart';
import '../Screens/onboarding/login.dart';
import '../Screens/onboarding/weSentAnOtp.dart';



class MainState extends ChangeNotifier {
  bool hasShownDialog = false; // Flag to track if dialog has been shown

  void shownDialog() {
    hasShownDialog = true;
    notifyListeners();
  }


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
  bool OtpCheckState = false;
  bool ForgetPasswordState = false;
  bool ChangePasswordState = false;
  String success = '';
  String loginUserName = '';
  String passwordUserName = '';
  String successUser = '';
  String errorLogin = '';

  String forgotPasswordError = '';
  String oldPassword = '';
  String newPassword = '';
  String changePasswordError = '';
  List<Map<String, dynamic>> childDetails = [];

  String day = '';
  String month = '';


  int? activeChild;

  void LoggingIn(bool Login) {
   LogInState = Login;
   print(LogInState);
    notifyListeners();
  }

  void otpCheck(bool Login) {
    OtpCheckState = Login;
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

  void changeActiveChild(int child) {
    activeChild = child;
    notifyListeners();
  }


  String childFirstName = '';
  String childLastName = '';
  String childAge = '';
  String childId = '';
  String sex = '';


  void changeChildId(String childid) {
    childId = childid;
    notifyListeners();
  }

  //Set all ChildInfo
  void selectedChild({required String firstName, required String lastName, required String id, required String gender}){
    childFirstName = firstName;
    childLastName = lastName;
    childId = id;
    sex = gender;
    // Name = firstName;
    // Surname = lastName;
    notifyListeners();
  }

  void formatDateOfBirth(List<dynamic>? dateList) {
    if (dateList == null || dateList.isEmpty || dateList.length < 3) {
      dob = 'N/A';
    } else {
      String? year = dateList[0].toString();
      String? month = dateList[1].toString().padLeft(2, '0'); // Add leading zero if necessary
      String? day = dateList[2].toString().padLeft(2, '0');   // Add leading zero if necessary
      dob = '$day/$month/$year';
    }

    print(dob);
    childAge = calculateAge(dob);

    notifyListeners();
  }


  String calculateAge(String dob) {
    if (dob == 'N/A') {
      return 'N/A'; // Return 'N/A' if dob is invalid
    }

    List<String> parts = dob.split('/');
    if (parts.length != 3) {
      return 'N/A'; // Return 'N/A' if dob format is incorrect
    }

    int day = int.parse(parts[0]);
    int month = int.parse(parts[1]);
    int year = int.parse(parts[2]);

    DateTime birthDate = DateTime(year, month, day);
    DateTime currentDate = DateTime.now();

    int years = currentDate.year - birthDate.year;
    int months = currentDate.month - birthDate.month;
    int days = currentDate.day - birthDate.day;

    // Adjust the months and years if needed
    if (days < 0) {
      months--;
    }
    if (months < 0) {
      years--;
      months += 12;
    }

    // Return the age in months if less than a year old
    if (years < 1) {

      if (months == 1) {
        return '$months month';
      } else {
        return '$months months';}
    }

    if (years == 1) {
      return '$years year';
    }

    return '$years years';
  }




  void ForgetPassword(bool ForgetPassword) {
    ForgetPasswordState = ForgetPassword;
    notifyListeners();
  }
  void ChangePasswordss(bool ChangePasswordss) {
    ChangePasswordState = ChangePasswordss;
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

    if (registrationData['success']) {


     //  Navigator.push(
     //    context,
     //    MaterialPageRoute(builder: (context) => congratulations()),
     //  );
     //  print(registrationData);
     //  print('User signed up successfully');
     // SignInUser(false);


      // LoggingIn(false);

      // SigningInError(true);


      // print('Failed to sign up user: ${response.body}');

      // LoggingIn(false);
      print(registrationData);
      error = registrationData['message'];

      Utils.showCustomSuccessSnackBar(message: error);
      // print('I ran now now');

      // verifyEmail();

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => congratulations()),
      );



      print(error);
      // Future.delayed(const Duration(seconds: 15) ,() => SigningInError(false));
      SignInUser(false);

    } else {
      // SigningInError(true);
      print('Failed to sign up user: ${response.body}');
      // LoggingIn(false);
      print(registrationData);
      error = registrationData['message'];
      Utils.showCustomErrorSnackBar(message: error);
      print(error);
      // Future.delayed(const Duration(seconds: 15) ,() => SigningInError(false));
      // SignInUser(false);

    }
    SignInUser(false);
    notifyListeners();
  }

  // Future<void> verifyEmail() async {
  //   final url = Uri.parse(
  //       'https://seahorse-app-9ubkt.ondigitalocean.app/api/v1/auth/resend-verify-login-otp/$emailController');
  //   print('hi');
  //   final response = await post(
  //     url,
  //     headers: {
  //       'Accept': '*/*',
  //       'Content-Type': 'application/json',
  //     },
  //
  //   );
  //
  //   if (response.statusCode == 200) {
  //     final Map<String, dynamic> registrationData = json.decode(response.body);
  //
  //     print(registrationData);
  //     print('email sent successfully');
  //   } else {
  //     print('Failed to sign up user: ${response.body}');
  //     final Map<String, dynamic> registrationData = json.decode(response.body);
  //
  //     print(registrationData);
  //     error = registrationData['message'];
  //     print(error);
  //   }
  //   notifyListeners();
  // }


  Future<void> forgotPassword({required String Gmail}) async {
    ForgetPassword(true);
    final url = Uri.parse(
        'https://seahorse-app-9ubkt.ondigitalocean.app/api/v1/auth/forgot-password/$Gmail');
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
      ForgetPassword(false);
      // forgotPasswordError = registrationData['message'];
      print('OTP re-sent successfully');
    } else {
      print('Failed to sign up user: ${response.body}');
      final Map<String, dynamic> registrationData = json.decode(response.body);
      ForgetPassword(false);

      print(registrationData);
      //  forgotPasswordError = registrationData['message'];
      print(forgotPasswordError);
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

  // Future<void> verifyOtp(BuildContext context) async {
  //   otpCheck(true);
  //
  //   final url = Uri.parse(
  //       'https://seahorse-app-9ubkt.ondigitalocean.app/api/v1/auth/verify-login/$verifyPhone');
  //   print('hi');
  //   final response = await post(
  //     url,
  //     headers: {
  //       'Accept': '*/*',
  //       'Content-Type': 'application/json',
  //     },
  //   );
  //
  //   if (response.statusCode == 200) {
  //     final Map<String, dynamic> registrationData = json.decode(response.body);
  //
  //
  //
  //     // Navigator.push(
  //     //   context,
  //     //   MaterialPageRoute(builder: (context) => bottomnavigationbar()),
  //     // ) ;
  //
  //     print(registrationData);
  //
  //     statusVerifyPhone = registrationData['message'];
  //
  //
  //     fetchChild(context);
  //
  //     print('email sent successfully');
  //   } else {
  //     print('Failed to sign up user: ${response.body}');
  //     final Map<String, dynamic> registrationData = json.decode(response.body);
  //
  //     print(registrationData);
  //     statusVerifyPhone = registrationData['message'];
  //     print(error);
  //   }
  //   otpCheck(false);
  //   notifyListeners();
  // }



  Future<void> verifyingEmail(BuildContext context) async {
    otpCheck(true);

    final url = Uri.parse('https://seahorse-app-9ubkt.ondigitalocean.app/api/v1/auth/verify-email/$verifyPhone');

    final response = await post(
      url,
      headers: {
        'Accept': '*/*',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $userToken', // Add your token here
      },
    );

    final Map<String, dynamic> emailMessageData = json.decode(response.body);
    if (response.statusCode == 200) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      print(emailMessageData);

      statusVerifyPhone = emailMessageData['message'];

      Utils.showCustomSuccessSnackBar(message: statusVerifyPhone);

      prefs.setBool('verified', true);


      fetchChild(context);


      print('Email verification successful.');
    } else {
      print('Error: ${response.statusCode}');
      print(response.body); // To get more information about the error

      statusVerifyPhone = emailMessageData['message'];
      Utils.showCustomErrorSnackBar(message: statusVerifyPhone);
      print(error);
    }
    statusVerifyPhone = '';
    // Future.delayed(Duration(seconds: 5), () {
    //   statusVerifyPhone = '';
    //   print('Wetin dey occur');
    // });
    otpCheck(false);
    notifyListeners();
  }




  // String token= '';
  String userToken = '';
  String Name = '';
  String Surname = '';
  String Gmail = '';
  String PhoneNumber = '';
  String userId = '';
  String dob = '';
  late bool verification;


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
      Utils.showCustomSuccessSnackBar(message: loginData['message']);

      SharedPreferences prefs = await SharedPreferences.getInstance();


      print(loginData);
      print('Logged in successfully');

      prefs.setString('userToken', loginData['jwtToken']);
      prefs.setString('name', loginData['data']['firstName']);
      prefs.setString('surname', loginData['data']['lastName']);
      prefs.setString('number', loginData['data']['phoneNumber']);
      prefs.setString('gmail', loginData['data']['email']);
      prefs.setString('userId', loginData['data']['id'].toString());
      prefs.setBool('verified', loginData['data']['verified']);

      userToken = prefs.getString('userToken')!;
      Name = prefs.getString('name')!;
      Surname = prefs.getString('surname')!;
      Gmail = prefs.getString('gmail')!;
      PhoneNumber = prefs.getString('number')!;
      userId = prefs.getString('userId')!;
      verification = prefs.getBool('verified')!;



      successUser = loginData['success'].toString();
      bool verified = loginData['data']['verified'];

      // generateQRCode();

      // successUser != 'true' && verified != 'true' ? : ;

      print('Checking : ${verified}');

      successUser == 'true'  ? verified == true ? fetchChild(context) : Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => otp()),
      )  : null ;

      // LoggingIn(false);

    } else {
      print('Status: ${response.statusCode}');
      print('Wrong user details: $loginData');
      loginData['message'] == "Cannot invoke \"java.time.temporal.Temporal.until(java.time.temporal.Temporal, java.time.temporal.TemporalUnit)\" because \"temporal1Inclusive\" is null" || loginData['message'] == 'Invalid username or password' ? Utils.showCustomErrorSnackBar(message: 'Invalid Username or Password') : errorLogin = loginData['message'];



      print(errorLogin);
    }

    LoggingIn(false);
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
        await prefs.remove('userId');
        await prefs.remove('verified');

        // Clear variables
        userToken = '';
        Name = '';
        Surname = '';
        Gmail = '';
        PhoneNumber = '';
        userId = '';


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

  Future<void> ChangePasswords(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    ChangePasswordss(true);
    //String? token = prefs.getString('jwt_token');

    final url = Uri.parse(
        'https://seahorse-app-9ubkt.ondigitalocean.app/api/v1/users/change-password');

    final response = await post(
      url,
      headers: {
        'Accept': '*/*',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $userToken',
      },
      body: jsonEncode({
        "email": Gmail,
        "oldPassword": oldPassword,
        "newPassword": newPassword,
      }),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> changePassword = json.decode(response.body);
      ChangePasswordss(false);
      changePasswordError = changePassword['message'];
      print('success');

      Future.delayed(Duration(milliseconds: 500), () {
        Navigator.pop(context);
      });
    } else {
      ChangePasswordss(false);
      print('failed');
      final Map<String, dynamic> changePassword = json.decode(response.body);
      changePasswordError = changePassword['message'];
    }
    notifyListeners();
  }


  Future<void> AddChild(BuildContext context) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();

    final url = Uri.parse(
      'https://seahorse-app-9ubkt.ondigitalocean.app/api/v1/parent/$userId/add-child',
    );

    // late Response response;

    print(userId);
    for (var child in Child.Childs) {
      final response = await post(
        url,
        headers: {
          'Accept': '*/*',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $userToken',
        },
        body: jsonEncode({
          'id': userId,
          'firstName': child['firstName'],
          'lastName': child['lastName'],
          'gender': child['gender'],
          'dateOfBirth': child['dob']
        }),
      );



      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        try {
          print('Status: ${response.statusCode}');
          // print('Child added Successfully');
          print(responseData["message"]);


          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //       builder: (context) => login()
          //   ),
          // );
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


  Future<void> GetUserDetails(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print('hi');

    final url = Uri.parse(
        'https://seahorse-app-9ubkt.ondigitalocean.app/api/v1/users/get-details/$Gmail');

    final response = await get(
      url,
      headers: {
        'Accept': '*/*',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${prefs.getString('userToken')!}',

      },

    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> getUserDetails = json.decode(response.body);
      print(getUserDetails);

      print('success');
    } else {
      final Map<String, dynamic> getUserDetails = json.decode(response.body);
      print(getUserDetails);

    }
    notifyListeners();
  }



  //Child Details
  Future<void> fetchChild(BuildContext context) async {
    // otpCheck(true);
    SharedPreferences prefs = await SharedPreferences.getInstance();

    userId = prefs.getString('userId')!;
    userToken = prefs.getString('userToken')!;
    Name = prefs.getString('name')!;
    Surname = prefs.getString('surname')!;
    Gmail = prefs.getString('gmail')!;
    PhoneNumber = prefs.getString('number')!;




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
        childDetails = responseData.cast<Map<String, dynamic>>();



        if (responseData.isEmpty){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChildDetails()),
          );

          print(responseData);
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => bottomnavigationbar(
              initFunction: () {
                // Your function logic here
                // showDialog(
                //   context: context,
                //   builder: (BuildContext context) {
                //     return CheckInDialog();
                //   },
                // );


                CheckInDialog();

              },
            )),
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
    otpCheck(false);
    notifyListeners();
  }



  String latestMessage = '';
  String latestMood = '';
  String reportId = '';


  Future<void> handleLatestReport(BuildContext context,List<dynamic> reports) async {
    if (reports.isNotEmpty) {
      // Get the latest report (assuming the latest is the last in the list)
      final latestJson = reports.last as Map<String, dynamic>;

      // Convert it to a ReportSummary object
      ReportSummary latestReport = ReportSummary.fromJson(latestJson);

      // Extract message and mood
      latestMessage = latestReport.message;
      latestMood = latestReport.mood;
      reportId = latestReport.reportId;

      print('Latest Message: $latestMessage');
      print('Latest Mood: $latestMood');

      await fetchAllChildReports(context, reportId);
    } else {
      print('No reports available.');
      // Extract message and mood
      latestMessage = '';
      latestMood = '';
      allReports.clear(); // Clear previous reports
      parseResponse(allReports);
    }
  }



  // Future<void> getChildReports(BuildContext context) async {
  //   // SharedPreferences prefs = await SharedPreferences.getInstance();
  //
  //   final url = Uri.parse(
  //     'https://seahorse-app-9ubkt.ondigitalocean.app/api/v1/report/child/$childId/reports',
  //   );
  //
  //   try {
  //     final response = await get(
  //       url,
  //       headers: {
  //         'Accept': '*/*',
  //         'Content-Type': 'application/json',
  //         'Authorization': 'Bearer $userToken',
  //       },
  //     );
  //
  //     if (response.statusCode == 200) {
  //       final List<dynamic> reports = json.decode(response.body);
  //       // print(reports);
  //
  //       handleLatestReport(context, reports);
  //       // Handle the success case, e.g., updating the UI or saving the data
  //     } else if (response.statusCode == 401) {
  //       print('Unauthorized request. Please check your credentials.');
  //       // Handle the unauthorized case, perhaps by asking the user to log in again
  //     } else {
  //       print('Failed to load reports. Status code: ${response.statusCode}');
  //       final Map<String, dynamic> errorDetails = json.decode(response.body);
  //       print(errorDetails);
  //     }
  //   } catch (e) {
  //     print('An error occurred: $e');
  //     // Optionally, you could show a snackbar or alert to the user
  //   }
  //
  //   notifyListeners();
  // }

  // Future<void> fetchAllChildReports(BuildContext context, int reportId) async {
  //   print('Clearing previous reports...');
  //   allReports.clear(); // Clear the list
  //
  //   print('Fetching reports for child with ID: $reportId');
  //
  //   final baseUrl = 'https://seahorse-app-9ubkt.ondigitalocean.app/api/v1/report/$reportId';
  //   final endpoints = [
  //     'meal-report',
  //     'physical-activities-reports',
  //     'nap-reports',
  //     'diaper-reports',
  //   ];
  //
  //   try {
  //     // Fetch all reports in parallel
  //     final responses = await Future.wait(
  //       endpoints.map((endpoint) async {
  //         final url = Uri.parse('$baseUrl/$endpoint');
  //         final response = await get(
  //           url,
  //           headers: {
  //             'Accept': '*/*',
  //             'Content-Type': 'application/json',
  //             'Authorization': 'Bearer $userToken',
  //           },
  //         );
  //         return {'endpoint': endpoint, 'response': response};
  //       }).toList(),
  //     );
  //
  //     // Process each response
  //     for (var entry in responses) {
  //       final String endpoint = entry['endpoint'] as String;  // Explicitly cast to String
  //       final Response response = entry['response'] as Response;  // Explicitly cast to http.Response
  //
  //       if (response.statusCode == 200) {
  //         final responseData = json.decode(response.body);
  //         allReports.add({endpoint: responseData});
  //       } else if (response.statusCode == 401) {
  //         print('Unauthorized request for $endpoint. Please check your credentials.');
  //         break; // Stop further requests if unauthorized
  //       } else {
  //         print('Failed to fetch data from $endpoint. Status code: ${response.statusCode}');
  //       }
  //     }
  //   } catch (e) {
  //     print('An error occurred while fetching reports: $e');
  //   }
  //
  //   print(allReports);
  // }

  bool isFetchingReports = false;

  Future<void> getChildReports(BuildContext context) async {
    // Ensure we print the current state before doing anything
    print('Before fetch: isFetchingReports = $isFetchingReports');

    if (isFetchingReports) {
      print('Already fetching reports. Aborting additional request.');
      return; // Prevent multiple fetches
    }

    isFetchingReports = true;
    notifyListeners(); // Update UI to reflect loading state
    print('Fetching started: isFetchingReports = $isFetchingReports');

    final url = Uri.parse(
      'https://seahorse-app-9ubkt.ondigitalocean.app/api/v1/report/child/$childId/reports',
    );

    try {
      final response = await get(
        url,
        headers: {
          'Accept': '*/*',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $userToken',
        },
      );

      print('Child ID: $childId');
      if (response.statusCode == 200) {
        final List<dynamic> reports = json.decode(response.body);
        handleLatestReport(context, reports); // Process the reports
      } else if (response.statusCode == 401) {
        print('Unauthorized request. Please check your credentials.');
      } else {
        print('Failed to load reports. Status code: ${response.statusCode}');
        final Map<String, dynamic> errorDetails = json.decode(response.body);
        print(errorDetails);
      }
    } catch (e) {
      print('An error occurred: $e');
    } finally {
      isFetchingReports = false; // Always reset this, even on error
      notifyListeners(); // Ensure UI updates
      print('Fetching completed: isFetchingReports = $isFetchingReports');
    }
  }



  List<Map<String, dynamic>> allReports = [];




  List<MealReport> mealReports = [];
  List<DiaperReport> diaperReports = [];

  Future<void> fetchAllChildReports(BuildContext context, String reportId) async {
    // print('fetchAllChildReports function called');
    // if (isFetchingReports) return; // Prevent multiple fetches
    // isFetchingReports = true;

    if (isFetchingReports) {
      print('Fetch already in progress, exiting...'); // Debugging line
      return; // Prevent multiple fetches
    }

    // isFetchingReports = true; // Set the flag to true
    // print('fetchAllChildReports function started');

    try {
      allReports.clear(); // Clear previous reports
      print('Fetching reports for child with ID: $reportId');

      final baseUrl = 'https://seahorse-app-9ubkt.ondigitalocean.app/api/v1/report/$reportId';
      final endpoints = [
        'meal-report',
        'nap-reports',
        'diaper-reports',
      ];

      final responses = await Future.wait(
        endpoints.map((endpoint) async {
          final url = Uri.parse('$baseUrl/$endpoint');
          final response = await get(
            url,
            headers: {
              'Accept': '*/*',
              'Content-Type': 'application/json',
              'Authorization': 'Bearer $userToken',
            },
          );
          return {'endpoint': endpoint, 'response': response};
        }).toList(),
      );

      for (var entry in responses) {
        final String endpoint = entry['endpoint'] as String;
        final Response response = entry['response'] as Response;

        if (response.statusCode == 200) {
          final responseData = json.decode(response.body);
          allReports.add({endpoint: responseData});
        } else if (response.statusCode == 401) {
          print('Unauthorized request for $endpoint. Please check your credentials.');
          break;
        } else {
          print('Failed to fetch data from $endpoint. Status code: ${response.statusCode}');
        }
      }
    } catch (e) {
      print('An error occurred while fetching reports: $e');
    } finally {
      // isFetchingReports = false; // Reset flag
      // print(allReports);

      parseResponse(allReports);
      print(mealReports);
      print(diaperReports);
    }
  }


  void parseResponse(List<dynamic> jsonResponse) {
    mealReports.clear();
    diaperReports.clear();

    for (var item in jsonResponse) {
      if (item.containsKey('meal-report')) {
        mealReports = (item['meal-report'] as List)
            .map((data) => MealReport.fromJson(data))
            .toList();
      } else if (item.containsKey('diaper-reports')) {
        diaperReports = (item['diaper-reports'] as List)
            .map((data) => DiaperReport.fromJson(data))
            .toList();
      }
    }

    // Now you can use the parsed data to build your UI
  }



  // Future<void> fetchChildEventReport(BuildContext context, String childId) async {
  //
  //   try {
  //     final baseUrl = 'https://seahorse-app-9ubkt.ondigitalocean.app/api/v1/events/$childId';
  //
  //     // Construct the request URL
  //     final url = Uri.parse(baseUrl);
  //     print('Fetching event report for child with ID: $childId');
  //
  //     // Send the GET request
  //     final response = await get(
  //       url,
  //       headers: {
  //         'Accept': '*/*',
  //         'Authorization': 'Bearer $userToken',
  //       },
  //     );
  //
  //     // Check response status
  //     if (response.statusCode == 200) {
  //       final responseData = json.decode(response.body);
  //       print('Successfully fetched reports for $childId');
  //       print(responseData);
  //     } else if (response.statusCode == 401) {
  //       print('Unauthorized request. Please check your credentials.');
  //     } else {
  //       print('Failed to fetch data. Status code: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     print('An error occurred while fetching reports: $e');
  //   }
  // }


  Stream<Map<String, dynamic>> fetchChildEventStream() async* {
    while (true) {
      await Future.delayed(Duration(seconds: 5)); // Fetch data every 5 seconds (or your preferred interval)

      final url = Uri.parse('https://seahorse-app-9ubkt.ondigitalocean.app/api/v1/events/$childId');
      final response = await get(
        url,
        headers: {
          'Accept': '*/*',
          'Authorization': 'Bearer $userToken',
        },
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        yield responseData; // Send data through the stream
      } else {
        throw Exception('Failed to load event reports');
      }
    }
  }


  String qrCode = '';



  Future<void> generateQRCode() async {
    final url = Uri.parse('https://seahorse-app-9ubkt.ondigitalocean.app/api/v1/timesheet/generate-qr-code');

    final response = await post(
      url,
      headers: {
        'Authorization': 'Bearer $userToken', // Add your token here
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print('QR Code generated successfully.');
      print('QR Code Data: ${data['data']['qrCode']}'); // Base64 string of the QR code

      qrCode = data['data']['qrCode'];
    } else {
      print('Error: ${response.statusCode}');
      print(response.body); // To get more information about the error
    }
    notifyListeners();
  }



  // Future<void> generateQRCode() async {
  //   final url = Uri.parse('https://seahorse-app-9ubkt.ondigitalocean.app/api/v1/timesheet/generate-qr-code');
  //   final response = await post(
  //     url,
  //     headers: {
  //       'Authorization': 'Bearer $userToken', // Add your token here
  //     },
  //   );
  //
  //   if (response.statusCode == 200) {
  //     final data = jsonDecode(response.body);
  //     print('QR Code generated successfully.');
  //
  //     // Get the Base64 string of the QR code
  //     final qrCodeBase64 = data['data']['qrCode'];
  //     print('QR Code Data (Base64): $qrCodeBase64');
  //
  //     // Convert the Base64 string to bytes
  //     List<int> qrCodeBytes = base64Decode(qrCodeBase64);
  //
  //     // Ensure the byte length is at least 16 bytes for UUID
  //     if (qrCodeBytes.length >= 16) {
  //       // Extract the first 16 bytes
  //       List<int> uuidBytes = qrCodeBytes.sublist(0, 16);
  //
  //       // Generate the UUID from the bytes
  //       var uuid = Uuid.unparse(uuidBytes);
  //       print('Generated UUID: $uuid');
  //     } else {
  //       print('Not enough bytes for UUID conversion');
  //     }
  //
  //     // Store the qrCode if needed
  //     qrCode = qrCodeBase64;
  //   } else {
  //     print('Error: ${response.statusCode}');
  //     print(response.body); // For more detailed error information
  //   }
  //
  //   notifyListeners();
  // }

  Future<bool> getCheckInStatus({required String childId}) async {
    // Define the endpoint URL with the provided childId
    final url = Uri.parse('https://seahorse-app-9ubkt.ondigitalocean.app/api/v1/timesheet/check-in-status/$childId');

    // Make the GET request
    final response = await get(
      url,
      headers: {
        'accept': '*/*',
        'Authorization': 'Bearer $userToken', // Pass the token here
      },
    );

    // Check the response status
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(data);
      print('Check-in status message: ${data['message']}');
      print('Checked in today: ${data['checkedIn']}');

      // Return the checked-in status
      return data['checkedIn'];
    } else {
      print('Error: ${response.statusCode}');
      print(response.body); // To get more information about the error

      // Return null if there's an error
      return false;
    }
  }




  Future<void> checkIn({required String scannedQRCode, required String childId}) async {
    final url = Uri.parse('https://seahorse-app-9ubkt.ondigitalocean.app/api/v1/timesheet/check-in');

    final response = await post(
      url,
      headers: {
        'accept': '*/*',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $userToken', // Add your token here
      },
      body: jsonEncode({
        'generatedQRCode': qrCode,
        'scannedQRCode': scannedQRCode,
        'childId': childId,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(data);
      print('Check-in successful: ${data['timeSheetResponse']['message']}');
    } else {
      print('Error: ${response.statusCode}');
      print(response.body); // To get more information about the error
    }
    notifyListeners();
  }

  List<String> checkInChildren = [];

  Future<void> multipleCheckIn({required String scannedQRCode}) async {
    final url = Uri.parse('https://seahorse-app-9ubkt.ondigitalocean.app/api/v1/timesheet/check-in');

    print('List of Children IDs: $checkInChildren');

    for (var child in checkInChildren) {
        final response = await post(
          url,
          headers: {
            'accept': '*/*',
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $userToken', // Add your token here
          },
          body: jsonEncode({
            'generatedQRCode': qrCode,
            'scannedQRCode': scannedQRCode,
            'childId': child,
          }),
        );

        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          print(data);
          print('Check-in successful: ${data['timeSheetResponse']['message']}');
        } else {
          print('Error: ${response.statusCode}');
          print(response.body); // To get more information about the error
        }
      }
      checkInChildren.clear();
      notifyListeners();
    }
}
