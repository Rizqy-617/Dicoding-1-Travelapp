import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:travenor/constant/route.dart';
import 'package:travenor/screen/auth/forgot_password.dart';
import 'package:travenor/screen/auth/signin.dart';
import 'package:travenor/screen/auth/signup.dart';
import 'package:travenor/screen/home/home_main.dart';
import 'package:travenor/screen/onboarding/onboarding.dart';
import 'package:travenor/screen/splash_screen/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      builder: FlutterSmartDialog.init(),
      routes: {
        RouteName.splashScreen: (context) => const SplashScreen(),
        RouteName.onboarding: (context) => const OnboardingScreen(),
        RouteName.signIn: (context) => const SignIn(),
        RouteName.forgotPassword: (context) => const ForgotPassword(),
        RouteName.signUp: (context) => const SignUp(),
        RouteName.home: (context) => const HomeMain(),
      },
      initialRoute: RouteName.splashScreen,
    );
  }
}


