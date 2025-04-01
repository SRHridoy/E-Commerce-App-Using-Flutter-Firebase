import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../const/all_colors.dart';
import '../const/all_sizes.dart';
import '../const/all_styles.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';

class SetupScreen extends StatelessWidget {
  const SetupScreen({super.key});

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
              backgroundColor: AllColors.arrowColor,
              child: Icon(
                Icons.arrow_back,
                color: AllColors.blackColor,
              ),
            ),
            Gap(30),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Profile Setup',
                    style: AllStyles.headingTextStyle,
                  ),
                  Gap(20),
                  Text(
                    'Please fill be below details to complete \nyour profile.',
                    textAlign: TextAlign.center,
                    style: AllStyles.subtitleTextStyle.copyWith(fontSize: 11),
                  ),
                  Gap(15),
                  Stack(
                      clipBehavior: Clip.none,
                      children: [
                    Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                            color: AllColors.primaryColor, width: 1.5),
                      ),
                      child: Icon(Icons.person,size: 100,color: Colors.grey,),
                    ),
                    Positioned
                      (
                      top: 70,
                      left: 90,
                      child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: AllColors.whiteColor,
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                            color: AllColors.primaryColor, width: 1.5),
                      ),
                      child: Icon(Icons.camera_alt,size: 20,color: AllColors.primaryColor,),
                    ),)
                  ])
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Gap(20),
                  CustomTextfield(hintText: 'Full Name'),
                  Gap(29),
                  CustomTextfield(hintText: 'Address'),
                  Gap(29),
                  CustomTextfield(hintText: 'Phone Number'),
                  Gap(40),
                  CustomButton(
                    title: 'Complete Set Up',
                    size: AllSizes.large,
                    height: 58,
                    width: MediaQuery.of(context).size.width,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
