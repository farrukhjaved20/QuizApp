// ignore_for_file: unused_local_variable, deprecated_member_use

import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:quiz_app/authentication/login/login.dart';
import 'package:quiz_app/const/colors.dart';
import 'package:quiz_app/const/controllers.dart';
import 'package:quiz_app/views/home/homeview.dart';
import 'package:video_player/video_player.dart';

class FirebaseControllers extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final Controllers myController = Get.put(Controllers());
  Rx<User?> user = Rx<User?>(null);
  // Future<UserCredential> signInWithGoogle() async {
  //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //   final GoogleSignInAuthentication? googleAuth =
  //       await googleUser?.authentication;

  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth?.accessToken,
  //     idToken: googleAuth?.idToken,
  //   );
  //   return await FirebaseAuth.instance.signInWithCredential(credential);
  // }

  // Future<UserCredential> signInWithFacebook() async {
  //   // Trigger the sign-in flow
  //   final LoginResult loginResult = await FacebookAuth.instance.login();

  //   // Create a credential from the access token
  //   final OAuthCredential facebookAuthCredential =
  //       FacebookAuthProvider.credential(loginResult.accessToken!.token);

  //   // Once signed in, return the UserCredential
  //   return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  // }

  Future<void> signUp() async {
    try {
      UserCredential authResult = await auth.createUserWithEmailAndPassword(
        email: myController.emailController.value.text,
        password: myController.passwordController.value.text,
      );

      Get.offAll(() => const HomeView());
      Get.snackbar(
        "Successfully",
        "Signed Up",
        backgroundColor: AppColors.asparagus,
        colorText: Colors.white,
      );
    } catch (e) {
      Get.snackbar(
        "Sign Up Error",
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

//----------------------------------------------------Sign In
  Future<void> signIn() async {
    try {
      UserCredential authResult = await auth.signInWithEmailAndPassword(
        email: myController.emailController.value.text,
        password: myController.passwordController.value.text,
      );
      Get.offAll(() => const HomeView());
      Get.snackbar(
        "Successfully",
        "Signed In",
        backgroundColor: AppColors.asparagus,
        colorText: Colors.white,
      );
    } catch (e) {
      Get.snackbar(
        "Sign In Error",
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

//----------------------------------------------------singout
  Future<void> signOut() async {
    try {
      await auth.signOut();
      myController.emailController.value.clear();
      myController.passwordController.value.clear();
      myController.repasswordController.value.clear();
      Get.offAll(() => const LoginView());
      Get.snackbar(
        "Successfully",
        "Signed Out",
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (e) {
      Get.snackbar(
        "Sign Out Error",
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void islogin(BuildContext context) {
    final user = auth.currentUser;
    if (user != null) {
      Timer(
          const Duration(seconds: 2), () => Get.offAll(() => const HomeView()));
    } else {
      Timer(const Duration(seconds: 2),
          () => Get.offAll(() => const LoginView()));
    }
  }

  Future<VideoPlayerController> initializeVideoController() async {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference videoRef = storage.ref().child('video/video.mp4');

    try {
      final String downloadUrl = await videoRef.getDownloadURL();
      final VideoPlayerController videoController =
          VideoPlayerController.network(downloadUrl);
      await videoController.initialize();
      videoController.play();
      videoController.setLooping(true);
      return videoController;
    } catch (e) {
      print('Error initializing video controller: $e');
      rethrow; // Propagate the error
    }
  }
}
