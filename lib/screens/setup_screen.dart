import 'package:e_commerce_app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../const/all_colors.dart';
import '../const/all_sizes.dart';
import '../const/all_styles.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';

class SetupScreen extends StatelessWidget {
  SetupScreen({super.key});

  AuthController authController = Get.put(AuthController());
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<AuthController>(builder: (_) {
        return SingleChildScrollView(
          child: Container(
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
                        style:
                            AllStyles.subtitleTextStyle.copyWith(fontSize: 12),
                      ),
                      Gap(15),
                      Stack(clipBehavior: Clip.none, children: [
                        authController.selectedFile == null
                            ? Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                      color: AllColors.primaryColor,
                                      width: 1.5),
                                ),
                                child: Icon(
                                  Icons.person,
                                  size: 80,
                                  color: Colors.grey,
                                ),
                              )
                            : Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                      color: AllColors.primaryColor,
                                      width: 1.5),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.file(
                                    authController.selectedFile!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                        Positioned(
                          top: 70,
                          left: 70,
                          child: GestureDetector(
                            onTap: () {
                              authController.pickImage();
                            },
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                color: AllColors.whiteColor,
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(
                                    color: AllColors.primaryColor, width: 1.5),
                              ),
                              child: Icon(
                                Icons.camera_alt,
                                size: 20,
                                color: AllColors.primaryColor,
                              ),
                            ),
                          ),
                        )
                      ])
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Gap(20),
                      CustomTextfield(
                        hintText: 'Full Name',
                        controller: nameController,
                      ),
                      Gap(29),
                      CustomTextfield(
                        hintText: 'Address',
                        controller: addressController,
                      ),
                      Gap(29),
                      CustomTextfield(
                        hintText: 'Phone Number',
                        controller: phoneController,
                      ),
                      Gap(40),
                      authController.isLoading
                          ? CircularProgressIndicator(
                              color: AllColors.primaryColor,
                            )
                          : CustomButton(
                              title: 'Complete Set Up',
                              size: AllSizes.large,
                              height: 58,
                              width: MediaQuery.of(context).size.width,
                              onTap: () {
                                if (nameController.text.isNotEmpty &&
                                    addressController.text.isNotEmpty &&
                                    phoneController.text.isNotEmpty) {
                                  authController.saveUserProfile(
                                      nameController.text,
                                      addressController.text,
                                      phoneController.text);
                                } else {
                                  Get.snackbar(
                                      'Error', 'Please fill all the fields');
                                }
                              },
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
