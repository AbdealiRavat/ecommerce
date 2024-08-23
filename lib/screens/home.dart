import 'package:ecommerce_app/controller/home_controller.dart';
import 'package:ecommerce_app/controller/products_controller.dart';
import 'package:ecommerce_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeController homeController = Get.put(HomeController());
  ProductController productController = Get.put(ProductController());
  @override
  void initState() {
    homeController.categories();
    homeController.pages();
    homeController.tabs();
    homeController.search();
    productController.products();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        body: SafeArea(
          child: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle(
                statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark),
            child: Stack(
              children: [
                Obx(() => homeController.pageList[homeController.pageIndex.value][0]),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                      decoration:
                          BoxDecoration(color: txtColor, borderRadius: BorderRadius.circular(40.r)),
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
                                    print(homeController.pageList[homeController.pageIndex.value][0]
                                        .toString());
                                    // if (homeController.pageIndex.value == 1) {
                                    //   Get.to(() => CartScreen());
                                    // }
                                  },
                                  child: AnimatedContainer(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
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
                )
              ],
            ),
          ),
        ));
  }
}
