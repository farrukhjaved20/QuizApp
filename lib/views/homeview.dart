import 'package:flutter/material.dart';
import 'package:quiz_app/const/Dimensions.dart';
import 'package:quiz_app/const/colors.dart';
import 'package:quiz_app/const/strings.dart';
import 'package:quiz_app/widgets/popupmenu.dart';
import 'package:quiz_app/widgets/roundbutton.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: Dimensions.height10),
          Container(
            padding: EdgeInsets.only(right: Dimensions.width10),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomPopmenubutton(),
              ],
            ),
          ),
          SizedBox(height: Dimensions.height30),
          SizedBox(
            height: Dimensions.height120,
            width: Dimensions.width400,
            child: Image.asset(
              'assets/images/logo.png',
              alignment: Alignment.center,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: Dimensions.height30,
              left: Dimensions.width30,
            ),
            child: Text(
              'AgTech Academy',
              style: Raleway.getBoldStyle(
                  fontSize: Dimensions.font24, color: AppColors.asparagus),
            ),
          ),
          SizedBox(height: Dimensions.height190),
          Container(
            padding: EdgeInsets.only(
              left: Dimensions.width20,
            ),
            child: RoundButtton(
              title: 'Start',
              onTap: () {},
              height: Dimensions.paddingVer60,
              width: Dimensions.width180,
            ),
          ),
          SizedBox(height: Dimensions.height50),
          Container(
            padding: EdgeInsets.only(
              top: Dimensions.height10,
              left: Dimensions.width20,
            ),
            child: Text(
              'Lorem ipsum is a placeholder text commonly \nused for demonstrating meaningful content',
              style: Raleway.getRegularStyle(
                color: AppColors.richblack,
                fontSize: Dimensions.font14,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: Dimensions.height50,
              left: Dimensions.width20,
            ),
            child: Text(
              'Total Score: 100 ',
              style: Raleway.getRegularStyle(
                color: AppColors.richblack,
                fontSize: Dimensions.font18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
