import 'package:e_commerce_app/const/all_colors.dart';
import 'package:e_commerce_app/const/all_sizes.dart';
import 'package:e_commerce_app/const/all_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../widgets/custom_button.dart';

class MyCartScreen extends StatelessWidget {
  const MyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Text(
          'My cart',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AllColors.transparentColor,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return _cartView();
              },
            )),
            Container(
              height: 120,
              padding: EdgeInsets.only(left: 25, right: 25, bottom: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Text(
                        'Total',
                        style: AllStyles.subtitleTextStyle,
                      )),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Image.asset('assets/images/crossnprimary.png'),
                            Gap(5),
                            Text(
                              '180000',
                              style: AllStyles.subtitleTextStyle,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Gap(20),
                  CustomButton(
                      title: 'Buy Now',
                      size: AllSizes.medium,
                      height: 48,
                      width: Get.width,
                      onTap: () {}),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _cartView() {
    return Container(
      padding: EdgeInsets.only(
        left: 25,
        right: 25,
        top: 10,
      ),
      decoration: BoxDecoration(
        color: AllColors.secondaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(flex: 3, child: Image.asset('assets/images/watch.png')),
          Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Apple W-series 6',
                    style: TextStyle(overflow: TextOverflow.ellipsis),
                  ),
                  Row(
                    children: [
                      Image.asset('assets/images/crossn.png'),
                      Gap(5),
                      Text(
                        '180000',
                        style: AllStyles.subtitleTextStyle,
                      ),
                    ],
                  )
                ],
              )),
          Expanded(
              flex: 2,
              child: Column(
                children: [
                  Text('Size: ${35}'),
                  Gap(3),
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: AllColors.primaryColor.withAlpha(90)),
                        color: Colors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.remove,
                          size: 22,
                          color: AllColors.primaryColor,
                          weight: 700,
                        ),
                        Text(
                          '1',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.add,
                          size: 24,
                          color: AllColors.primaryColor,
                          weight: 700,
                        ),
                      ],
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
