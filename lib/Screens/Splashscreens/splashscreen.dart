import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Styles/colors.dart';
import '../../stateManagement/providers.dart';
import '../onboarding/weSentAnOtp.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    super.initState();
    _checkLoginState(); // Check login state on splash screen
  }

  Future<void> _checkLoginState() async {
    // Wait for 2 seconds to simulate loading
    await Future.delayed(Duration(seconds: 2));

    final mainStateProvider = Provider.of<MainState>(context, listen: false);

    // Get SharedPreferences instance
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Check if the 'userToken' is present and not empty
    String? userToken = prefs.getString('userToken');
    bool? verified = prefs.getBool('verified');

    if (userToken != null && userToken.isNotEmpty) {
      print('Thus is the UserToken :- $userToken');
      print('Thus is the verification :- $verified');
      // If the token exists, check if the user is verified
      if (verified == true) {
        // Navigate to home screen if verified
        print('CRAZYYY!');
        mainStateProvider.fetchChild(context);
      } else {
        // Navigate to OTP verification screen if not verified
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => otp()),
        );
      }
    } else {
      // If no token, navigate to login screen
      Navigator.pushNamed(context, '/onBoard');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: white,
        ),
        child: const Center(
            child: Image(image: AssetImage('assets/images/emailPic.png'))),
      ),
    );
  }
}
