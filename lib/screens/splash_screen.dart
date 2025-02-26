import 'package:e_commerce_app/const/all_colors.dart';
import 'package:e_commerce_app/const/all_styles.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AllColors.primaryColor,
      body: Center(
        child: Text("PW E-commerce",style: AllStyles.headingTextStyle.copyWith(color: AllColors.whiteColor),),
      ),
    );
  }
}
