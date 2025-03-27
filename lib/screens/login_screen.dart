import 'package:e_commerce_app/const/all_colors.dart';
import 'package:e_commerce_app/const/all_sizes.dart';
import 'package:e_commerce_app/const/all_styles.dart';
import 'package:e_commerce_app/widgets/custom_button.dart';
import 'package:e_commerce_app/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(40),
            CircleAvatar(
              backgroundColor: AllColors.secondaryColor,
              child: Icon(Icons.arrow_back),
            ),
            Gap(30),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Login here',
                    style: AllStyles.headingTextStyle,
                  ),
                  Gap(20),
                  Text(
                    'Welcome back you’ve',
                    style: AllStyles.titleTextStyle,
                  ),
                  Text(
                    'been missed!',
                    style: AllStyles.titleTextStyle,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Gap(20),
                  CustomTextfield(hintText: 'Email'),
                  Gap(29),
                  CustomTextfield(hintText: 'Password'),
                  Gap(10),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      'Forgot your password?',
                      style: AllStyles.subtitleTextStyle
                          .copyWith(color: AllColors.primaryColor),
                    ),
                  ),
                  Gap(40),
                  CustomButton(
                    title: 'Sign In',
                    size: AllSizes.medium,
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    onTap: () {},
                  ),
                  Gap(40),
                  Text('Create a new account',style: AllStyles.subtitleTextStyle,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
