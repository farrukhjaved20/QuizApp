import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Controllers extends GetxController {
  final passwordController = TextEditingController().obs;
  final repasswordController = TextEditingController().obs;
  final emailController = TextEditingController().obs;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    repasswordController.value.dispose();
    passwordController.value.dispose();
    emailController.value.dispose();
  }

  void clear() {
    repasswordController.value.clear();
    passwordController.value.clear();
    emailController.value.clear();
  }
}
