import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peonyapp/bottomnavigationbar/bottomnavigationbar.dart';
import 'package:peonyapp/store/noNotification.dart';
import 'package:peonyapp/store/orders.dart';
// import 'package:peony_app_kazeem/accountsreens/createaccount.dart';
// import 'package:peony_app_kazeem/accountsreens/weSentAnOtp.dart';
// import 'package:peony_app_kazeem/store/orders.dart';
// import 'package:peony_app_kazeem/store/ordersCollectionDetails.dart';
// import 'package:peony_app_kazeem/store/orderscollection.dart';
import 'package:peonyapp/store/ordersCollectionDetails.dart';
import 'package:peonyapp/store/orderscollection.dart';

import 'Screens/Chats/chats.dart';
import 'Screens/Splashscreens/onboard.dart';
import 'Screens/Splashscreens/splashscreen.dart';
import 'accountsreens/weSentAnOtp.dart';

class routeManager {
  static const String homePageOne = '/';
  static const String onboarding = '/onBoard';
  static const String weSentAnOtp = '/weSentAnOtp';
  static const String splashScreen = '/splashscreen';
  static const String splashScreenFour = '/splashScreenFour';
  static const String splashScreenFive = '/splashScreenFive';
  static const String getStarted = '/getStarted';
  static const String doctorCategories = '/doctorCategories';
  static const String mainHomeScreenOne = '/mainHomeScreenOne';
  static const String doctorsSpecification = '/doctorsSpecfication';
  static const String doctorProfile = '/doctorProfile';
  static const String doctorLocation = '/doctorLocation';
  static const String appointmentScreenOne = '/appointmentScreenOne';
  static const String appointmentScreenTwo = '/appointmentScreenTwo';
  static const String messageOne = '/messageOne';
  static const String messageTwo = '/messageTwo';

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
      default:
        throw const FormatException('no route found');
    }
  }
}
