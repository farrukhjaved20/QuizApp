import 'package:flutter/material.dart';
import 'package:quiz_app/const/Dimensions.dart';
import 'package:quiz_app/const/colors.dart';
import 'package:quiz_app/const/strings.dart';

class CustomPopmenubutton extends StatelessWidget {
  const CustomPopmenubutton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      child: Row(
        children: [
          Text(
            'John Doe',
            style: Raleway.getRegularStyle(
                fontSize: Dimensions.font16, color: Colors.black87),
          ),
          SizedBox(width: Dimensions.width10),
          Icon(
            Icons.menu,
            color: AppColors.richblack,
            size: Dimensions.size20,
          )
        ],
      ),
      itemBuilder: (context) => [
        PopupMenuItem<int>(
            value: 1,
            child: Text(
              'John Doe',
              style: Raleway.getRegularStyle(
                  fontSize: Dimensions.font16, color: Colors.black87),
            )),
        PopupMenuItem<int>(
            value: 2,
            child: Text('Email',
                style: Raleway.getRegularStyle(
                    fontSize: Dimensions.font16, color: Colors.black87))),
        PopupMenuItem<int>(
            value: 3,
            child: Text(
              'LogOut',
              style: Raleway.getRegularStyle(
                  fontSize: Dimensions.font16, color: Colors.black87),
            )),
      ],
    );
  }
}
