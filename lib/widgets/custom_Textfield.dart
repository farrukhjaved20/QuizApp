// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:quiz_app/const/Dimensions.dart';
import 'package:quiz_app/const/colors.dart';
import 'package:quiz_app/const/strings.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final TextInputType keyboardType;
  final bool obscureText;
  final Function()? onPressed;
  final String? Function(dynamic value)? validator;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.label,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.onPressed,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Dimensions.width350,
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        cursorColor: Colors.white,
        style: Raleway.getRegularStyle(
            fontSize: Dimensions.font16,
            color: Colors.white,
            fontWeight: FontWeight.w400),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white.withAlpha(80),
          contentPadding: const EdgeInsets.fromLTRB(30, 10, 20, 30),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.asparagus),
              borderRadius: const BorderRadius.all(Radius.circular(30))),
          labelText: label,
          labelStyle: Raleway.getRegularStyle(
              fontSize: Dimensions.font16, color: Colors.white),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(30),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.asparagus,
            
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          errorStyle: Raleway.getRegularStyle(
            fontSize: Dimensions.font16,
            color: Colors.red,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.asparagus),
            borderRadius: BorderRadius.circular(30),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.asparagus),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        validator: validator,
      ),
    );
  }
}
