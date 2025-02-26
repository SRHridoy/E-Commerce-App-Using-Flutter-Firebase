import 'package:e_commerce_app/const/all_colors.dart';
import 'package:e_commerce_app/const/all_sizes.dart';
import 'package:flutter/material.dart';

class AllStyles{
  static final headingTextStyle = TextStyle(
    fontSize: AllSizes.extraLarge,
    fontWeight: FontWeight.bold,
    color: AllColors.primaryColor
  );
  static final titleTextStyle = TextStyle(
    fontSize: AllSizes.large,
    fontWeight: FontWeight.bold,
    color: AllColors.blackColor
  );
  static final subtitleTextStyle = TextStyle(
    fontSize: AllSizes.medium,
    fontWeight: FontWeight.bold,
    color: AllColors.blackColor
  );
}