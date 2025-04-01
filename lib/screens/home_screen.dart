import 'package:carousel_slider/carousel_slider.dart';
    import 'package:e_commerce_app/const/all_styles.dart';
    import 'package:flutter/material.dart';
    import 'package:gap/gap.dart';
    import 'package:get/get.dart';
    import 'package:get/get_core/src/get_main.dart';

    import '../const/all_colors.dart';

    class HomeScreen extends StatelessWidget {
      const HomeScreen({super.key});

      @override
      Widget build(BuildContext context) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: EdgeInsets.only(
                  top: 70,
                  left: 12,
                  right: 12,
                ),
                sliver: SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Row(
                        children: [
                          Text(
                            'Hello Nahiyan',
                            style: AllStyles.titleTextStyle,
                          ),
                          Gap(5),
                          Image.asset(
                            'assets/images/hand_hello.png',
                          ),
                        ],
                      ),
                      Text("Let's start shopping!",
                          style: TextStyle(color: AllColors.lightColor)),
                      Gap(20),
                      CarouselSlider.builder(
                        options: CarouselOptions(height: 130, viewportFraction: 0.7),
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) => Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: Container(
                            height: 130,
                            width: Get.width,
                            decoration: BoxDecoration(
                              color: AllColors.primaryColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Gap(5),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          '20% OFF DURING EID',
                                          style: AllStyles.titleTextStyle.copyWith(
                                              color: AllColors.whiteColor,
                                              fontSize: 13),
                                        ),
                                      ),
                                      Gap(5),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0),
                                        child: Container(
                                          height: 35,
                                          width: 80,
                                          decoration: BoxDecoration(
                                            color: AllColors.whiteColor,
                                            borderRadius: BorderRadius.circular(30),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Get Now',
                                              style: AllStyles.titleTextStyle.copyWith(
                                                  color: AllColors.starColor,
                                                  fontSize: 12),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Gap(5),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Center(
                                    child: Image.asset(
                                      'assets/images/shopping_hand.png',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Gap(15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Top Categories',
                            style: AllStyles.titleTextStyle.copyWith(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'See All',
                            style: AllStyles.titleTextStyle.copyWith(
                                color: AllColors.primaryColor,
                                fontSize: 14,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                      Gap(15),
                      SizedBox(
                        height: 70,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(right: 18),
                              child: Container(
                                width: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: AllColors.borderColor, width: 1.5),
                                  color: AllColors.borderInside,
                                ),
                                child: Icon(
                                  Icons.shopping_cart,
                                  size: 35,
                                  color: AllColors.lightColor.withAlpha(98),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Gap(15),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                sliver: SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    childAspectRatio: 5 / 7,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return itemView();
                    },
                    childCount: 10,
                  ),
                ),
              ),
            ],
          ),
        );
      }

      Widget itemView() {
        return Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AllColors.secondaryColor,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: AllColors.whiteColor,
                    ),
                    child: Text(
                      '50% OFF',
                      style: AllStyles.subtitleTextStyle.copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: AllColors.borderColor,
                          width: 2,
                        )),
                    child: Icon(
                      Icons.favorite,
                      color: AllColors.borderColor,
                    ),
                  )
                ],
              ),
              Image.asset(
                'assets/images/watch.png',
                height: 100,
                width: 150,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Redmi Note 4',
                    style: TextStyle(
                        color: AllColors.blackColor.withOpacity(0.7), fontSize: 14),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/crossn.png',
                          scale: 1,
                        ),
                        Gap(3),
                        Text(
                          '45,000',
                          style: AllStyles.subtitleTextStyle.copyWith(fontSize: 14),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/crossn.png',
                            scale: 2,
                            color: AllColors.lightColor,
                          ),
                          Gap(3),
                          Text(
                            '55,000',
                            style: TextStyle(
                                color: AllColors.lightColor,
                                decoration: TextDecoration.lineThrough,
                                fontSize: 8),
                          )
                        ],
                      ))
                ],
              )
            ],
          ),
        );
      }
    }