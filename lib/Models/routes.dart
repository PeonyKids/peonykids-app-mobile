import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:peonyapp/accountsreens/createaccount.dart';
// import 'package:peonyapp/accountsreens/login.dart';
// import 'package:peonyapp/accountsreens/securityQuestions.dart';
// import 'package:peonyapp/bottomnavigationbar/bottomnavigationbar.dart';
// import 'package:peonyapp/store/noNotification.dart';
// import 'package:peonyapp/store/orders.dart';
// import 'package:peony_app_kazeem/accountsreens/createaccount.dart';
// import 'package:peony_app_kazeem/accountsreens/weSentAnOtp.dart';
// import 'package:peony_app_kazeem/store/orders.dart';
// import 'package:peony_app_kazeem/store/ordersCollectionDetails.dart';
// import 'package:peony_app_kazeem/store/orderscollection.dart';
// import 'package:peonyapp/store/ordersCollectionDetails.dart';
// import 'package:peonyapp/store/orderscollection.dart';

import '../Screens/Chats/chats.dart';
import '../Screens/Splashscreens/onboard.dart';
import '../Screens/Splashscreens/splashscreen.dart';
import '../Screens/bottomnavigationbar/bottomnavigationbar.dart';
import '../Screens/onboarding/enterYourChildDetails.dart';
import '../Screens/onboarding/weSentAnOtp.dart';

class routeManager {
  static const String homePageOne = '/';
  static const String onboarding = '/onBoard';
  static const String weSentAnOtp = '/weSentAnOtp';
  static const String splashScreen = '/splashscreen';
  static const String childDetails = '/enterChildDetails';
  static const String chatting = '/chats';


  static Route<dynamic> routeSettings(RouteSettings settings) {
    switch (settings.name) {
      case onboarding:
        return MaterialPageRoute(builder: ((context) => OnboardOneScreen()));
      case homePageOne:
        return MaterialPageRoute(builder: ((context) => bottomnavigationbar()));
      case chatting:
        return MaterialPageRoute(builder: ((context) => Chats()));
      case weSentAnOtp:
        return MaterialPageRoute(builder: ((context) => otp()));
      case splashScreen:
        return MaterialPageRoute(builder: ((context) => SplashScreen()));
      case childDetails:
        return MaterialPageRoute(builder: ((context) => ChildDetails()));
      default:
        throw const FormatException('no route found');
    }
  }
}
