import 'package:ecommerce_app/screens/cart_screen.dart';
import 'package:ecommerce_app/screens/chat_screen.dart';
import 'package:ecommerce_app/screens/home_screen.dart';
import 'package:ecommerce_app/screens/profile/profile_screen.dart';
import 'package:ecommerce_app/screens/whishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';
import '../controller/products_controller.dart';
import '../utils/colors.dart';

class NavBar extends StatefulWidget {
  // Function onTap;
  NavBar({
    super.key,
    // required this.onTap
  });

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  HomeController homeController = Get.put(HomeController());
  ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          decoration: BoxDecoration(color: txtColor, borderRadius: BorderRadius.circular(40.r)),
          height: 70.h,
          // width: 200.h,
          child: ListView.builder(
              itemCount: homeController.pageList.length,
              shrinkWrap: true,
              // padding: EdgeInsets.symmetric(horizontal: 10.w),
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Obx(() => InkWell(
                      borderRadius: BorderRadius.circular(40),
                      onTap: () {
                        homeController.pageIndex.value = index;
                        print(index);
                        print(
                            homeController.pageList[homeController.pageIndex.value][0].toString());
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen()));
                        index == 0
                            ? Get.to(() => HomeScreen())
                            : index == 1
                                ? Get.to(() => CartScreen())
                                : index == 2
                                    ? Get.to(() => WishListScreen())
                                    : index == 3
                                        ? Get.to(() => ChatScreen())
                                        : Get.to(() => ProfileScreen());
                      },
                      child: AnimatedContainer(
                          margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                          padding: EdgeInsets.all(11.w),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: homeController.pageIndex.value == index
                                  ? secondaryColor
                                  : Colors.transparent),
                          duration: Duration(milliseconds: 250),
                          child: Image.asset(
                            homeController.pageIndex.value == index
                                ? 'asset/navbar/${homeController.pageList[index][2]}.png'
                                : 'asset/navbar/${homeController.pageList[index][1]}.png',
                            color: homeController.pageIndex.value == index
                                ? primaryColor
                                : secondaryColor.withOpacity(0.7),
                            height: 28.h,
                            width: 28.w,
                          )),
                    ));
              })),
    );
  }
}
