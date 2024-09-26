import 'package:PeonyKids/stateManagement/providers.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import 'package:provider/provider.dart';

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

import 'Models/routes.dart';
import 'Screens/Account/changePassword.dart';
import 'Screens/Account/checkIn.dart';
import 'Screens/Account/contactUs.dart';
import 'Screens/Account/editProfile.dart';
import 'Screens/Account/feedback.dart';
import 'Screens/Account/notification.dart';
import 'Screens/Chats/chats.dart';
import 'Screens/Home/homepage.dart';
import 'Screens/Splashscreens/onboard.dart';
import 'Screens/Splashscreens/splashscreen.dart';
import 'Styles/colors.dart';
import 'Screens/Home/notifications.dart';

// import 'package:firebase_core/firebase_core.dart';



void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: const FirebaseOptions(
  //     apiKey:
  //     "AIzaSyBK06F6axIgxV7j1mJIYa-96g-nsSgq5dQ", // paste your api key here
  //     appId:
  //     "1:441691677643:android:60a43969fefabe20148c4e", //paste your app id here
  //     messagingSenderId: "441691677643", //paste your messagingSenderId here
  //     projectId: "peonykids-app", //paste your project id here
  //   ),
  // );
  runApp(MyApp());
}

// import 'package:flutter_riverpod/flutter_riverpod.dart';

// void main() {
//   runApp(
//     // To install Riverpod, we need to add this widget above everything else.
//     // This should not be inside "MyApp" but as direct parameter to "runApp".
//     ProviderScope(
//       child: MyApp(),
//     ),
//   );
// }

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
        return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (context) =>   MainState())
            ],
                child:   MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          // chatting
          initialRoute: routeManager.splashScreen,
          onGenerateRoute: routeManager.routeSettings,
          theme: ThemeData(
              fontFamily: 'WorkSans',
              colorScheme: ColorScheme.fromSeed(seedColor: primaryColor01),
              useMaterial3: true,
              primaryColor: white),
        )
        );

      },
    );
  }
}
