// ignore_for_file: depend_on_referenced_packages, use_key_in_widget_constructors, prefer_const_constructors

import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:page_transition/page_transition.dart';
import 'package:quiz_app/authentication/login/login.dart';
import 'package:quiz_app/const/colors.dart';
import 'package:quiz_app/database/firebasecontrollers.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final FirebaseControllers user = Get.put(FirebaseControllers());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user.islogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        duration: 3000,
        splash: 'assets/images/15.png',
        splashIconSize: 150.0,
        nextScreen: LoginView(),
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.fade,
        backgroundColor: AppColors.asparagus,
      ),
    );
  }
}
