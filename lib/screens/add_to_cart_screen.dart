import 'package:e_commerce_app/const/all_colors.dart';
import 'package:e_commerce_app/const/all_sizes.dart';
import 'package:e_commerce_app/const/all_styles.dart';
import 'package:e_commerce_app/widgets/custom_box_for_item_number.dart';
import 'package:e_commerce_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AddToCartScreen extends StatefulWidget {
  AddToCartScreen({super.key});

  @override
  State<AddToCartScreen> createState() => _AddToCartScreenState();
}

class _AddToCartScreenState extends State<AddToCartScreen> {
  int _selected = -1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        backgroundColor: AllColors.secondaryColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: AllColors.secondaryColor,
                width: size.width,
                height: 220,
                child: Image.asset('assets/images/watch.png'),
              ),
              Gap(30),
              Container(
                padding: EdgeInsets.only(left: 15, right: 15, bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Apple Watch Series 6',
                      style: AllStyles.titleTextStyle,
                    ),
                    Gap(10),
                    SizedBox(
                        height: 20, width: size.width, child: ratingBuilder(4)),
                    Gap(10),
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Image.asset('assets/images/crossn.png'),
                              Gap(5),
                              Text(
                                '45,000',
                                style: AllStyles.titleTextStyle
                                    .copyWith(fontSize: 16)
                                    .copyWith(color: AllColors.blackColor),
                              ),
                              Gap(5),
                              Image.asset('assets/images/smallcrossn.png'),
                              Gap(3),
                              Text(
                                '55,000',
                                style: TextStyle(
                                    color: AllColors.strikeColor,
                                    fontSize: 12,
                                    decoration: TextDecoration.lineThrough),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Available in stock',
                            style: AllStyles.subtitleTextStyle
                                .copyWith(fontSize: 12),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                    Gap(15),
                    Text(
                      'About',
                      style: AllStyles.titleTextStyle.copyWith(fontSize: 15),
                    ),
                    Gap(10),
                    Text(
                      'The upgraded S6 SiP runs up to 20 percent faster, allowing apps to also launch 20 percent faster, while maintaining the same all-day 18-hour battery life.',
                      textAlign: TextAlign.justify,
                      style: AllStyles.subtitleTextStyle.copyWith(
                          color: AllColors.blackColor.withAlpha(90),
                          fontSize: 12),
                    ),
                    Gap(25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _selected == 0
                            ? selectedNumber('0')
                            : unSelectedNumber('0'),
                        _selected == 1
                            ? selectedNumber('1')
                            : unSelectedNumber('1'),
                        _selected == 2
                            ? selectedNumber('2')
                            : unSelectedNumber('2'),
                        _selected == 3
                            ? selectedNumber('3')
                            : unSelectedNumber('3'),
                        _selected == 4
                            ? selectedNumber('4')
                            : unSelectedNumber('4'),
                        _selected == 5
                            ? selectedNumber('5')
                            : unSelectedNumber('5'),
                      ],
                    ),
                    Gap(30),
                    CustomButton(
                      title: 'Add to cart',
                      size: AllSizes.medium,
                      height: 48,
                      width: size.width,
                      onTap: () {},
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget unSelectedNumber(String number) {
    return CustomBoxForItemNumber(
      number: number,
      color: AllColors.transparentColor,
      borderColor: AllColors.lightColor.withAlpha(70),
      textColor: AllColors.blackColor,
      onTap: () {
        setState(() {
          _selected = int.parse(number);
        });
      },
    );
  }

  Widget selectedNumber(String number) {
    return CustomBoxForItemNumber(
        number: number,
        color: AllColors.primaryColor,
        borderColor: AllColors.transparentColor,
        textColor: AllColors.whiteColor,
        onTap: () {
          setState(() {
            _selected = int.parse(number);
          });
        });
  }

  Widget ratingBuilder(int rating) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Icon(
            Icons.star,
            color: AllColors.starColor,
          );
        },
        itemCount: rating);
  }
}
