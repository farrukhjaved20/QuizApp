import 'package:flutter/material.dart';
import 'package:quiz_app/const/Dimensions.dart';
import 'package:quiz_app/const/colors.dart';
import 'package:quiz_app/const/strings.dart';
import 'package:quiz_app/widgets/popupmenu.dart';
import 'package:quiz_app/widgets/roundbutton.dart';

class Homewidget extends StatelessWidget {
  const Homewidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
        Padding(
          padding: EdgeInsets.only(left: Dimensions.width10),
          child: Center(
            child: Image.asset(
              'assets/images/1.png',
              height: Dimensions.height230,
              alignment: Alignment.topCenter,
            ),
          ),
        ),
        SizedBox(height: Dimensions.height100),
        Container(
          padding: EdgeInsets.only(
            left: Dimensions.width10,
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
              color: Colors.white,
              fontSize: Dimensions.font14,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(
            top: Dimensions.height30,
            left: Dimensions.width20,
          ),
          child: Text(
            'Total Score: 100 ',
            style: Raleway.getRegularStyle(
              color: Colors.white,
              fontSize: Dimensions.font18,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: Dimensions.width20, top: Dimensions.height80),
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
    );
  }
}
