import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/authentication/login/login.dart';
import 'package:quiz_app/const/Dimensions.dart';
// import 'package:quiz_app/const/colors.dart';
import 'package:quiz_app/const/strings.dart';
import 'package:quiz_app/database/firebasecontrollers.dart';

class CustomPopmenubutton extends StatelessWidget {
  const CustomPopmenubutton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final FirebaseControllers user = Get.put(FirebaseControllers());

    return PopupMenuButton<int>(
      child: Row(
        children: [
          Text(
            'John Doe',
            style: Raleway.getRegularStyle(
                fontSize: Dimensions.font16, color: Colors.white),
          ),
          SizedBox(width: Dimensions.width10),
          Icon(
            Icons.menu,
            color: Colors.white,
            size: Dimensions.size20,
          )
        ],
      ),
      itemBuilder: (context) => [
        PopupMenuItem<int>(
            value: 1,
            child: Text(
              auth.currentUser!.email.toString(),
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
          child: ListTile(
            title: Text('Logout',
                style: Raleway.getRegularStyle(
                    fontSize: Dimensions.font16, color: Colors.black87)),
            onTap: () {
              user.signOut();
            },
          ),
        ),
      ],
    );
  }
}
