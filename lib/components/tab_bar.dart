// ignore_for_file: prefer_const_constructors

import 'package:ecommerce_app/controller/home_controller.dart';
import 'package:ecommerce_app/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controller/products_controller.dart';
import '../utils/colors.dart';
import 'items_card.dart';

class MyTabBar extends StatefulWidget {
  TabController tabController;
  MyTabBar({super.key, required this.tabController});

  @override
  State<MyTabBar> createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar> {
  HomeController homeController = Get.put(HomeController());
  ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    List productData = productController.productsList.value;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TabBar(
            tabAlignment: TabAlignment.start,
            isScrollable: true,
            controller: widget.tabController,
            labelPadding: EdgeInsets.zero,
            labelColor: Colors.brown,
            indicatorColor: Colors.transparent,
            dividerColor: Colors.transparent,
            indicatorPadding: EdgeInsets.zero,
            splashFactory: NoSplash.splashFactory,
            // padding: EdgeInsets.all(5.w),
            onTap: (value) {
              print(value);
              homeController.tabIndex.value = value;
            },
            tabs: List.generate(
                homeController.tabList.length,
                (index) => Obx(() => Container(
                      margin: EdgeInsets.symmetric(horizontal: 5.w),
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.r),
                        color: homeController.tabIndex.value == index
                            ? primaryColor
                            : Colors.transparent,
                        border: Border.all(
                            color: homeController.tabIndex.value == index
                                ? Colors.transparent
                                : txtColor.withOpacity(0.2)),
                      ),
                      child: Text(
                        homeController.tabList[index],
                        style: TextStyle(
                            color: homeController.tabIndex.value == index ? white : txtColor,
                            fontSize: 15.sp),
                      ),
                    )))),
        Container(
          // height: double.maxFinite,
          constraints: BoxConstraints(minHeight: 200.h, maxHeight: 1000.h),
          child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              controller: widget.tabController,
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: 1,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 0.7,
                              crossAxisCount: 2,
                              crossAxisSpacing: 2.0,
                              mainAxisSpacing: 2.0),
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return InkWell(
                              borderRadius: BorderRadius.circular(15.r),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ProductDetailsScreen(
                                              index: index,
                                              data: productData,
                                            )));
                              },
                              child: ItemsCard(
                                  title: productData[index]['title'],
                                  image: productData[index]['image'],
                                  price: productData[index]['price'],
                                  rating: productData[index]['rating'],
                                  isLiked: productData[index]['isLiked']),
                            );
                          });
                    }),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: 1,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 0.7,
                              crossAxisCount: 2,
                              crossAxisSpacing: 2.0,
                              mainAxisSpacing: 2.0),
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return ItemsCard(
                                title: productData[index]['title'],
                                image: productData[index]['image'],
                                price: productData[index]['price'],
                                rating: productData[index]['rating'],
                                isLiked: productData[index]['isLiked']);
                          });
                    }),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: 1,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 0.7,
                              crossAxisCount: 2,
                              crossAxisSpacing: 2.0,
                              mainAxisSpacing: 2.0),
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return ItemsCard(
                                title: productData[index]['title'],
                                image: productData[index]['image'],
                                price: productData[index]['price'],
                                rating: productData[index]['rating'],
                                isLiked: productData[index]['isLiked']);
                          });
                    }),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: 1,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 0.7,
                              crossAxisCount: 2,
                              crossAxisSpacing: 2.0,
                              mainAxisSpacing: 2.0),
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return ItemsCard(
                                title: productData[index]['title'],
                                image: productData[index]['image'],
                                price: productData[index]['price'],
                                rating: productData[index]['rating'],
                                isLiked: productData[index]['isLiked']);
                          });
                    }),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: 1,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 0.7,
                              crossAxisCount: 2,
                              crossAxisSpacing: 2.0,
                              mainAxisSpacing: 2.0),
                          itemCount: 2,
                          itemBuilder: (context, index) {
                            return ItemsCard(
                                title: productData[index]['title'],
                                image: productData[index]['image'],
                                price: productData[index]['price'],
                                rating: productData[index]['rating'],
                                isLiked: productData[index]['isLiked']);
                          });
                    }),
              ]),
        ),
      ],
    );
  }
}
