import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/authentication/signup/signup.dart';
import 'package:quiz_app/const/Dimensions.dart';
import 'package:quiz_app/const/colors.dart';
import 'package:quiz_app/const/controllers.dart';
import 'package:quiz_app/const/strings.dart';
import 'package:quiz_app/database/firebasecontrollers.dart';
import 'package:quiz_app/widgets/custom_Textfield.dart';
import 'package:quiz_app/widgets/roundbutton.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Controllers controller = Get.put(Controllers());
    // final Functionality functionality = Get.put(Functionality());
    final FirebaseControllers firebase = Get.put(FirebaseControllers());
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Image.asset(
              'assets/images/1.png',
              height: Dimensions.height230,
            ),
            Center(
              child: SimpleDialog(
                elevation: 0,
                titleTextStyle: Raleway.getBoldStyle(
                    fontSize: Dimensions.font24, color: AppColors.nyanza),
                backgroundColor: Colors.black.withOpacity(0.01),
                title: const Center(
                  child: Text(
                    'Login',
                  ),
                ),
                children: [
                  CustomTextField(
                    controller: controller.emailController.value,
                    label: 'Email',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        Get.snackbar(
                          'Email',
                          'Email is Required',
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                        );
                      }
                      if (!GetUtils.isEmail(value)) {
                        Get.snackbar(
                          'Email',
                          'Invalid Email',
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                        );
                      }
                      return null; // No validation errors
                    },
                  ),
                  SizedBox(height: Dimensions.height10),
                  CustomTextField(
                    controller: controller.passwordController.value,
                    label: 'Password',
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        Get.snackbar(
                          'Password',
                          'Password is Required',
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                        );
                      }
                      if (!GetUtils.isLengthGreaterThan(value, 6)) {
                        Get.snackbar(
                          'Password',
                          'Invalid Password (Password should be more than 6 characters)',
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                        );
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: Dimensions.height10),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Forget Password',
                          style: Raleway.getBoldStyle(
                              fontSize: Dimensions.font14,
                              color: AppColors.nyanza),
                        ),
                        TextButton(
                          onPressed: () {
                            controller.passwordController.value.clear();
                            controller.emailController.value.clear();
                            Get.to(() => const SignUp());
                          },
                          child: Text(
                            'Sign Up',
                            style: Raleway.getBoldStyle(
                                fontSize: Dimensions.font24,
                                color: AppColors.nyanza),
                          ),
                        ),
                      ]),
                  RoundButtton(
                    width: Dimensions.width120,
                    height: Dimensions.height40,
                    title: 'Sign In',
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        try {
                          await firebase.signIn();
                        } catch (e) {
                          if (e.toString().contains(
                              "Password must be at least 8 characters long")) {
                            Get.snackbar("Password Error",
                                "Password must be at least 8 characters long");
                          } else {
                            Get.snackbar("Sign Up Error", e.toString());
                          }
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: Dimensions.width20, top: Dimensions.height50),
              child: Column(
                children: [
                  Text(
                    'Brought To You By',
                    style: Raleway.getBoldStyle(
                        fontSize: Dimensions.font14, color: AppColors.nyanza),
                  ),
                  Image.asset(
                    'assets/images/15.png',
                    height: Dimensions.height100,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
