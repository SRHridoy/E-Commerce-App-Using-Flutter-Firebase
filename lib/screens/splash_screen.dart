import 'package:e_commerce_app/const/all_colors.dart';
import 'package:e_commerce_app/const/all_styles.dart';
import 'package:e_commerce_app/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    _animateText();
    _navigateToWelcomeScreen();
  }

  _animateText() async {
    await Future.delayed(Duration(milliseconds: 500));
    setState(() {
      _opacity = 1.0;
    });
  }

  _navigateToWelcomeScreen() async {
    await Future.delayed(Duration(seconds: 3), () {});
    Get.off(() => WelcomeScreen(), transition: Transition.fadeIn, duration: Duration(milliseconds: 700));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AllColors.primaryColor,
      body: Center(
        child: AnimatedOpacity(
          opacity: _opacity,
          duration: Duration(seconds: 2),
          child: Text(
            "SR E-commerce",
            style: AllStyles.headingTextStyle.copyWith(color: AllColors.whiteColor),
          ),
        ),
      ),
    );
  }
}
