import 'package:flutter/material.dart';

import '../const/all_colors.dart';

class CustomTextfield extends StatelessWidget {
  String hintText;
  CustomTextfield({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: AllColors.primaryColor.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8)
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AllColors.transparentColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
            BorderSide(color: AllColors.primaryColor, width: 2),
          ),
        ),
      ),
    );
  }
}
