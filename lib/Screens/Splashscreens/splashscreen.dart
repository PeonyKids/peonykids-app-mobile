import 'package:flutter/material.dart';
import 'package:peonyapp/Styles/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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
            child: Image(image: AssetImage('assets/images/splash.png'))),
      ),
    );
  }
}
