// ignore_for_file: file_names, must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:quiz_app/const/Dimensions.dart';
import 'package:quiz_app/const/colors.dart';
import 'package:quiz_app/const/strings.dart';

class RoundButtton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final double? height;
  final double? width;

  const RoundButtton({
    super.key,
    required this.title,
    required this.onTap,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Dimensions.height10),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            elevation: 2,
            backgroundColor: AppColors.asparagus,
            shadowColor: AppColors.nyanza,
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimensions.height100))),
        child: Ink(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.height100)),
          child: Container(
            width: width,
            height: height,
            alignment: Alignment.center,
            child: Text(
              title,
              style: Raleway.getRegularStyle(
                  fontSize: Dimensions.font20, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
