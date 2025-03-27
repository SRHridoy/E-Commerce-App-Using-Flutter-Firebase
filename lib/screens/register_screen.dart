import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../const/all_colors.dart';
import '../const/all_sizes.dart';
import '../const/all_styles.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
                    'Create Account',
                    style: AllStyles.headingTextStyle,
                  ),
                  Gap(20),
                  Text(
                    'Create an account so you can explore all the',
                    style: AllStyles.subtitleTextStyle
                        .copyWith(color: AllColors.primaryColor,fontSize: 11),
                  ),
                  Text(
                    'existing jobs',
                    style: AllStyles.subtitleTextStyle
                        .copyWith(color: AllColors.primaryColor,fontSize: 11),
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
                  Gap(29),
                  CustomTextfield(hintText: 'Confirm Password'),
                  Gap(40),
                  CustomButton(
                    title: 'Sign Up',
                    size: AllSizes.medium,
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    onTap: () {},
                  ),
                  Gap(40),
                  Text(
                    'Already have a account?',
                    style: AllStyles.subtitleTextStyle,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
