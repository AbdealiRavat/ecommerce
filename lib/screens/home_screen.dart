// ignore_for_file: prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/components/search_textfield.dart';
import 'package:ecommerce_app/controller/home_controller.dart';
import 'package:ecommerce_app/controller/products_controller.dart';
import 'package:ecommerce_app/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:slide_countdown/slide_countdown.dart';

import '../components/tab_bar.dart';
import '../controller/cart_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  CarouselSliderController carouselController = CarouselSliderController();
  late TabController tabController;
  TextEditingController controller = TextEditingController();
  HomeController homeController = Get.put(HomeController());
  ProductController productController = Get.put(ProductController());
  CartController cartController = Get.put(CartController());

  @override
  void initState() {
    productController.products();
    tabController =
        TabController(length: homeController.tabList.length, vsync: this, initialIndex: 0);
    // homeController.pageIndex.value = 0;
    super.initState();
  }

  void onQueryChanged(String query) {
    setState(() {
      homeController.searchResults.value = homeController.searchList
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => ListView(
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
              children: [
                myAppbar(() {}),
                SizedBox(
                  height: 25.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: SearchTextField(
                      onQueryChanged: onQueryChanged,
                      controller: controller,
                    )),
                    SizedBox(
                      width: 10.w,
                    ),
                    Container(
                      padding: EdgeInsets.all(7.w),
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Image.asset(
                        'asset/filters.png',
                        height: 30.h,
                        color: white,
                      ),
                    )
                  ],
                ),
                Stack(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        CarouselSlider.builder(
                          itemCount: 3,
                          carouselController: carouselController,
                          options: CarouselOptions(
                              initialPage: 0,
                              onPageChanged: (index, reason) {
                                homeController.bannerIndex.value = index;
                              },
                              height: 200.h,
                              viewportFraction: 1,
                              autoPlay: false,
                              autoPlayInterval: Duration(seconds: 3),
                              enlargeCenterPage: true),
                          itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
                              Container(
                            // padding: EdgeInsets.symmetric(horizontal: 2.w),
                            child: Image.asset(
                              'asset/banner/banner2.png',
                            ),
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: List<Widget>.generate(
                                5,
                                (index) => Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                                      child: Container(
                                        height: 10.w,
                                        width: 10.w,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: homeController.bannerIndex.value == index
                                                ? Colors.brown
                                                : Colors.brown.withOpacity(0.2)),
                                      ),
                                    )),
                          ),
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Category',
                              style: TextStyle(
                                  color: txtColor, fontWeight: FontWeight.w600, fontSize: 22.sp),
                            ),
                            Text(
                              'See All',
                              style: TextStyle(
                                  color: Colors.brown.shade600,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18.sp),
                            ),
                          ],
                        ),
                        Container(
                          height: 100.h,
                          // color: Colors.red,
                          // padding: EdgeInsets.symmetric(vertical: 5.h),
                          margin: EdgeInsets.symmetric(vertical: 15.h),
                          child: ListView.builder(
                              itemCount: homeController.categoryList.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 70.w,
                                      width: 70.w,
                                      margin: EdgeInsets.only(right: index == 4 ? 0.w : 22.w),
                                      padding: EdgeInsets.all(18.w),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle, color: secondaryColor),
                                      child: Image.asset(
                                        'asset/${homeController.categoryList[index].toString()}.png',
                                        color: primaryColor,
                                      ),
                                    ),
                                    Container(
                                        // color: Colors.red,
                                        width: 70.w,
                                        child: Center(
                                            child: Text(
                                          homeController.categoryList[index]
                                              .toString()
                                              .capitalizeFirst
                                              .toString(),
                                          style: TextStyle(color: txtColor),
                                        )))
                                  ],
                                );
                              }),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Flash Sale',
                              style: TextStyle(
                                  color: txtColor, fontWeight: FontWeight.w600, fontSize: 22.sp),
                            ),
                            Row(
                              children: [
                                Text(
                                  'Closing in :  ',
                                  style: TextStyle(
                                    color: txtColor,
                                  ),
                                ),
                                SlideCountdownSeparated(
                                  duration: Duration(hours: 20),
                                  style: TextStyle(color: primaryColor),
                                  separatorStyle: TextStyle(color: primaryColor),
                                  // durationTitle: DurationTitle(days: 'D', hours: 'H', minutes: 'M', seconds: 'S'),
                                  // separatorType: SeparatorType.title,
                                  shouldShowSeconds: (p0) {
                                    return p0.inDays == 0 ? true : false;
                                  },
                                  shouldShowMinutes: (p0) {
                                    return p0.inMinutes == 0 ? true : true;
                                  },
                                  shouldShowHours: (p0) {
                                    return p0.inHours == 0 ? true : true;
                                  },
                                  onDone: () {},
                                  decoration: BoxDecoration(
                                      color: secondaryColor,
                                      borderRadius: BorderRadius.circular(5.r)),
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        MyTabBar(tabController: tabController),

                        // Column(
                        //   children: [
                        //     Row(
                        //       mainAxisAlignment: MainAxisAlignment.center,
                        //       children: [
                        //         ItemsCard(title: 'Brown Jacket', image: '4', price: '75.45', rating: '4.3', isLiked: true),
                        //         ItemsCard(title: 'Brown T-Shirt', image: '6', price: '80.55', rating: '2.3', isLiked: false),
                        //       ],
                        //     ),
                        //     Row(
                        //       mainAxisAlignment: MainAxisAlignment.center,
                        //       children: [
                        //         ItemsCard(title: 'Brown Jacket', image: '5', price: '88.45', rating: '3.9', isLiked: false),
                        //         ItemsCard(title: 'White Shirt', image: '10', price: '96.55', rating: '4.7', isLiked: true),
                        //       ],
                        //     ),
                        //   ],
                        // ),
                        SizedBox(
                          height: 100.h,
                        ),
                      ],
                    ),
                    controller.text.isNotEmpty
                        ? Container(
                            decoration: BoxDecoration(
                                color: secondaryColor, borderRadius: BorderRadius.circular(10.r)),
                            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                            margin: EdgeInsets.symmetric(vertical: 10.h),
                            child: homeController.searchResults.isEmpty
                                ? Center(child: Text('No result found'))
                                : ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: homeController.searchResults.length,
                                    itemBuilder: (context, index) {
                                      return searchTile(homeController.searchResults, index);
                                    },
                                  ),
                          )
                        : Container(),
                  ],
                )
              ],
            )));
  }

  Widget myAppbar(onTap) {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      // padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                // homeController.cityName.value,
                'Location',
                style: TextStyle(color: txtColor.withOpacity(0.8), fontSize: 16.sp),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Image.asset(
                    'asset/location.png',
                    height: 20.h,
                    color: primaryColor,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  // Obx(()=>
                  Text(
                    // homeController.cityName.value,
                    'Ahmedabad',
                    style: TextStyle(color: txtColor, fontWeight: FontWeight.w600, fontSize: 18.sp),
                  ),
                ],
              ),
            ],
          ),
          InkWell(
              onTap: onTap,
              child: Container(
                padding: EdgeInsets.all(5.w),
                decoration: BoxDecoration(color: grey, borderRadius: BorderRadius.circular(20.r)),
                child: Icon(
                  Icons.notifications,
                  size: 30.r,
                  color: primaryColor,
                ),
              )),
        ],
      ),
    );
  }

  Widget searchTile(txt, index) {
    return InkWell(
      onTap: () {
        print(txt[index]);
      },
      child: Container(
          decoration: BoxDecoration(
            color: secondaryColor,
          ),
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(txt[index])],
          )),
    );
  }
}
