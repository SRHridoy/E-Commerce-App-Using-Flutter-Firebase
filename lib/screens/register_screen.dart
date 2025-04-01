import 'package:e_commerce_app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../const/all_colors.dart';
import '../const/all_sizes.dart';
import '../const/all_styles.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  AuthController authController = Get.put(AuthController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GetBuilder<AuthController>(
        builder:  (_) {
          return Container(
            width: MediaQuery
                .of(context)
                .size
                .width,
            padding: EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(80),
                // CircleAvatar(
                //   backgroundColor: AllColors.arrowColor,
                //   child: Icon(Icons.arrow_back, color: AllColors.blackColor,),
                // ),
                // Gap(30),
                SizedBox(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
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
                        textAlign: TextAlign.center,
                        style: AllStyles.subtitleTextStyle
                            .copyWith(fontSize: 11),
                      ),
                      Text(
                        'existing jobs', textAlign: TextAlign.center,
                        style: AllStyles.subtitleTextStyle
                            .copyWith(fontSize: 11),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Gap(20),
                      CustomTextfield(hintText: 'Email',
                        controller: emailController,
                      ),
                      Gap(29),
                      CustomTextfield(hintText: 'Password',
                        controller: passwordController,
                        isPassword: true,
                      ),
                      Gap(29),
                      CustomTextfield(hintText: 'Confirm Password',
                        controller: confirmPasswordController,
                        isPassword: true,
                      ),
                      Gap(40),
                      authController.isLoading ? Center(
                        child: CircularProgressIndicator(color: AllColors.primaryColor,),
                      ) :
                      CustomButton(
                        title: 'Sign Up',
                        size: AllSizes.large,
                        height: 58,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        onTap: () {
                          if(emailController.text.isNotEmpty && passwordController.text.isNotEmpty && confirmPasswordController.text.isNotEmpty){
                            if(passwordController.text == confirmPasswordController.text){
                              authController.createAccount(emailController.text, passwordController.text);
                            }else{
                              Get.snackbar('Error', 'Password does not match');
                            }
                          }else{
                            Get.snackbar('Error', 'Please fill all the fields');
                          }
                        },
                      ),
                      Gap(40),
                      InkWell(
                        onTap: () {
                          Get.offNamed('/login');
                        },
                        child: Text(
                          'Already have a account?',
                          style: AllStyles.subtitleTextStyle.copyWith(
                              color: AllColors.primaryColor),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      )
    );
  }
}
