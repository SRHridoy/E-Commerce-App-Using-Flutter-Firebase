import 'package:e_commerce_app/const/all_colors.dart';
import 'package:e_commerce_app/const/all_sizes.dart';
import 'package:e_commerce_app/const/all_styles.dart';
import 'package:e_commerce_app/widgets/custom_button.dart';
import 'package:e_commerce_app/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GetBuilder<AuthController>(
        builder: (_) {
          return Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(80),
                // CircleAvatar(
                //   backgroundColor: AllColors.arrowColor,
                //   child: Icon(
                //     Icons.arrow_back,
                //     color: AllColors.blackColor,
                //   ),
                // ),
                // Gap(30),
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
                        style: AllStyles.titleTextStyle
                            .copyWith(fontWeight: FontWeight.w600,fontSize: 14),
                      ),
                      Text(
                        'been missed!',
                        style: AllStyles.titleTextStyle
                            .copyWith(fontWeight: FontWeight.w600,fontSize: 14),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Gap(20),
                      CustomTextfield(
                          hintText: 'Email', controller: emailController),
                      Gap(29),
                      CustomTextfield(
                        hintText: 'Password',
                        controller: passwordController,
                        isPassword: true,
                      ),
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
                      authController.isLoading
                          ? Center(
                              child: CircularProgressIndicator(
                                color: AllColors.primaryColor,
                              ),
                            )
                          : CustomButton(
                              title: 'Sign In',
                              size: AllSizes.large,
                              height: 58,
                              width: MediaQuery.of(context).size.width,
                              onTap: () {
                                if (emailController.text.isNotEmpty &&
                                    passwordController.text.isNotEmpty) {
                                  authController.loginAccount(emailController.text,
                                      passwordController.text);
                                  Get.offAllNamed('/home');
                                } else {
                                  Get.snackbar(
                                      'Error', 'Please fill all the fields');
                                }
                              },
                            ),
                      Gap(40),
                      InkWell(
                          onTap: () {
                            Get.offNamed('/register');
                          },
                          child: Text(
                            'Create a new account',
                            style: AllStyles.subtitleTextStyle
                                .copyWith(color: AllColors.primaryColor),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
