import 'package:e_commerce_app/const/all_colors.dart';
import 'package:e_commerce_app/const/all_sizes.dart';
import 'package:e_commerce_app/const/all_styles.dart';
import 'package:e_commerce_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 40, left: 12, right: 12, bottom: 30),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset('assets/images/welcome.png'),
            ),
            Text(
              'Discover Your',
              style: AllStyles.headingTextStyle,
            ),
            Text(
              'Dream Job here',
              style: AllStyles.headingTextStyle,
            ),
            Gap(20),
            Text(
              'Explore all the existing job roles based on your interest and study major',
              style: AllStyles.subtitleTextStyle.copyWith(
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.center,
            ),
            Gap(50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomButton(
                  title: 'Login',
                  size: AllSizes.large,
                  height: 60,
                  width: 160,
                  onTap: () {},
                ),
                TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: AllColors.blackColor,
                    ),
                    onPressed: () {

                }, child: Text('Register',style: TextStyle(
                  fontSize: AllSizes.large
                )))
              ],
            )
          ],
        ),
      ),
    );
  }
}
