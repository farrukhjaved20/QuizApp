import 'package:flutter/material.dart';
import 'package:quiz_app/const/Dimensions.dart';
import 'package:quiz_app/const/colors.dart';

class SocialAccount extends StatelessWidget {
  final double height;
  final double width;
  final String networkUrl;
  final Function()? ontap;

  const SocialAccount({
    Key? key,
    required this.networkUrl,
    required this.ontap,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      radius: 10,
      splashColor: AppColors.timberwolf,
      borderRadius: BorderRadius.circular(Dimensions.width100),
      onTap: ontap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white70,
            width: 3,
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
          image: DecorationImage(
            image: NetworkImage(networkUrl),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
