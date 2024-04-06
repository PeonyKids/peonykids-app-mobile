import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:peony_app_kazeem/accountsreens/createaccount.dart';
// import 'package:peony_app_kazeem/accountsreens/enterYourChildDetails.dart';
// import 'package:peony_app_kazeem/accountsreens/forgotPassword.dart';
// import 'package:peony_app_kazeem/accountsreens/login.dart';
// import 'package:peony_app_kazeem/accountsreens/securityQuestions.dart';
// import 'package:peony_app_kazeem/accountsreens/weSentAnOtp.dart';
// import 'package:peony_app_kazeem/bottomnavigationbar/bottomnavigationbar.dart';
// import 'package:peony_app_kazeem/home.dart';
// import 'package:peony_app_kazeem/notifications.dart';
// import 'package:peony_app_kazeem/payment/payment.dart';
//
//
// import 'package:peony_app_kazeem/store/cartPage.dart';
// import 'package:peony_app_kazeem/store/particluarStorePage.dart';
// import 'package:peony_app_kazeem/store/storepage.dart';

import 'Styles/colors.dart';
import 'bottomnavigationbar/bottomnavigationbar.dart';
import 'notifications.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (context, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          // initialRoute: routeManager.homePage,
          // onGenerateRoute: routeManager.routeSettings,
          theme: ThemeData(
              fontFamily: 'WorkSans',
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
              primaryColor: white),
          home: bottomnavigationbar(),
        );
      },
    );
  }
}
