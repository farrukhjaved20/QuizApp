import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/authentication/login.dart';
import 'package:quiz_app/const/Dimensions.dart';
import 'package:quiz_app/const/colors.dart';
import 'package:quiz_app/const/controllers.dart';
import 'package:quiz_app/const/strings.dart';
import 'package:quiz_app/database/firebasecontrollers.dart';

import 'package:quiz_app/database/functionality.dart';
import 'package:quiz_app/views/homeview.dart';
import 'package:quiz_app/widgets/custom_Textfield.dart';
import 'package:quiz_app/widgets/roundbutton.dart';
import 'package:quiz_app/widgets/socialaccountbutton.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final Controllers controller = Get.put(Controllers());
    final Functionality functionality = Get.put(Functionality());
    final FirebaseControllers firebase = Get.put(FirebaseControllers());
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Padding(
                  padding: EdgeInsets.only(top: Dimensions.paddingVer60),
                  child: Text(
                    'Sign Up',
                    style: Raleway.getBoldStyle(
                        fontSize: Dimensions.font24,
                        color: AppColors.asparagus),
                  ),
                )
              ]),
              SizedBox(height: Dimensions.height80),
              CustomTextField(
                controller: controller.emailController.value,
                label: 'Please Enter Your Email',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email is required';
                  }
                  if (!GetUtils.isEmail(value)) {
                    return 'Invalid Email';
                  }
                  return null;
                },
              ),
              CustomTextField(
                controller: controller.passwordController.value,
                label: 'Please Enter Your Password',
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password is required';
                  }
                  if (!GetUtils.isLengthGreaterThan(value, 6)) {
                    return 'Invalid Password (Password should be more than 6 characters)';
                  }
                  return null;
                },
              ),
              CustomTextField(
                controller: controller.repasswordController.value,
                obscureText: true,
                label: 'Confirm password',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password is required';
                  }
                  if (!GetUtils.isLengthGreaterThan(value, 6)) {
                    return 'Password should be more than 6 characters';
                  }
                  if (value != controller.passwordController.value.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              Padding(
                  padding: EdgeInsets.only(
                      right: Dimensions.width30,
                      left: Dimensions.width30,
                      top: Dimensions.height10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Obx(
                        () => Checkbox(
                          checkColor: Colors.blue,
                          value: functionality.remembermee.value,
                          activeColor: Colors.blue,
                          shape: const CircleBorder(),
                          onChanged: (value) {
                            functionality.rememberme();
                          },
                        ),
                      ),
                      Text(
                        'Remember me',
                        style: Raleway.getRegularStyle(
                            fontSize: Dimensions.font16,
                            color: AppColors.airsuporityblue),
                      ),
                    ],
                  )),
              Container(
                margin: EdgeInsets.only(top: Dimensions.height30),
                child: Column(
                  children: [
                    Text(
                      'Sign up with social account',
                      style: Raleway.getRegularStyle(
                          decoration: TextDecoration.underline,
                          fontSize: Dimensions.font18,
                          color: Colors.black),
                    )
                  ],
                ),
              ),
              SizedBox(height: Dimensions.height20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SocialAccount(
                    height: Dimensions.height50,
                    width: Dimensions.width51,
                    networkUrl:
                        'https://img.freepik.com/premium-vector/facebook-icon_488108-2.jpg',
                    ontap: () {
                      firebase.signInWithFacebook().then((value) {
                        Get.snackbar(
                          'Successfully',
                          'Signed Up',
                          backgroundColor: AppColors.asparagus,
                          colorText: Colors.white,
                        );
                        Get.offAll(() => const HomeView());
                      });
                    },
                  ),
                  SocialAccount(
                    height: Dimensions.height50,
                    width: Dimensions.width51,
                    networkUrl:
                        'https://i.pinimg.com/564x/89/73/d4/8973d4473f428cb78cca39f82c15af3e.jpg',
                    ontap: () {
                      firebase.signInWithGoogle().then((value) {
                        Get.snackbar(
                          'Successfully',
                          'Signed Up',
                          backgroundColor: AppColors.asparagus,
                          colorText: Colors.white,
                        );
                        Get.offAll(() => const HomeView());
                      });
                    },
                  )
                ],
              ),
              SizedBox(height: Dimensions.height30),
              RoundButtton(
                width: Dimensions.width350,
                height: Dimensions.dataheight70,
                title: 'Sign Up',
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    try {
                      await firebase.signUp();
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
              SizedBox(height: Dimensions.height10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account ?",
                    style: Raleway.getRegularStyle(
                        decoration: TextDecoration.none,
                        fontSize: Dimensions.font18,
                        color: Colors.black),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(() => const LoginView());
                    },
                    child: Text(
                      'Sign in',
                      style: Raleway.getRegularStyle(
                          decoration: TextDecoration.none,
                          fontSize: Dimensions.font18,
                          color: AppColors.airsuporityblue),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
