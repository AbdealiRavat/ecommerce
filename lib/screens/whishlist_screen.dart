import 'package:ecommerce_app/controller/wishlist_controller.dart';
import 'package:ecommerce_app/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../components/items_card.dart';
import '../controller/home_controller.dart';
import '../utils/colors.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> with TickerProviderStateMixin {
  late TabController tabController;

  HomeController homeController = Get.put(HomeController());
  WishlistController wishlistController = Get.put(WishlistController());
  @override
  void initState() {
    wishlistController.wishListItems();
    wishlistController.categories();
    tabController =
        TabController(length: wishlistController.categoryList.length, vsync: this, initialIndex: 0);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List productData = wishlistController.wishList;
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 20.w),
        children: [
          myAppbar(() {}),
          SizedBox(
            height: 25.h,
          ),
          Column(
            children: [
              TabBar(
                  isScrollable: true,
                  controller: tabController,
                  labelPadding: EdgeInsets.zero,
                  labelColor: Colors.brown,
                  tabAlignment: TabAlignment.start,
                  indicatorColor: Colors.transparent,
                  dividerColor: Colors.transparent,
                  splashFactory: NoSplash.splashFactory,
                  // padding: EdgeInsets.all(5.w),
                  onTap: (value) {
                    print(value);
                    wishlistController.categoryIndex.value = value;
                  },
                  tabs: List.generate(
                      wishlistController.categoryList.length,
                      (index) => Obx(() => Container(
                            margin: EdgeInsets.symmetric(horizontal: 5.w),
                            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.r),
                              color: wishlistController.categoryIndex.value == index
                                  ? primaryColor
                                  : Colors.transparent,
                              border: Border.all(
                                  color: wishlistController.categoryIndex.value == index
                                      ? Colors.transparent
                                      : txtColor.withOpacity(0.2)),
                            ),
                            child: Text(
                              wishlistController.categoryList[index],
                              style: TextStyle(
                                  color: wishlistController.categoryIndex.value == index
                                      ? white
                                      : txtColor,
                                  fontSize: 15.sp),
                            ),
                          )))),
              SizedBox(
                height: 15.h,
              ),
              Container(
                // height: double.maxFinite,
                constraints: BoxConstraints(minHeight: 200.h, maxHeight: 1000.h),
                child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: tabController,
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
                                itemCount: 7,
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
                                itemCount: 3,
                                itemBuilder: (context, index) {
                                  return productData[index]['type'] ==
                                          wishlistController.categoryIndex.value
                                      ? ItemsCard(
                                          title: productData[index]['title'],
                                          image: productData[index]['image'],
                                          price: productData[index]['price'],
                                          rating: productData[index]['rating'],
                                          isLiked: productData[index]['isLiked'])
                                      : Container();
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
                                itemCount: 1,
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
                                itemCount: 1,
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
          )
        ],
      ),
    );
  }

  Widget myAppbar(onTap) {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      // padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              homeController.pageIndex.value = 0;
              // Get.back();
            },
            child: Container(
              height: 45.h,
              width: 45.w,
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(shape: BoxShape.circle, color: white, boxShadow: [
                BoxShadow(
                    color: grey.withOpacity(0.5),
                    spreadRadius: 1,
                    offset: Offset(1, 1),
                    blurRadius: 1)
              ]),
              child: Icon(
                Icons.arrow_back,
                color: primaryColor,
              ),
            ),
          ),
          Text(
            // homeController.cityName.value,
            'My Wishlist',
            style: TextStyle(
                color: txtColor.withOpacity(0.8), fontSize: 18.sp, fontWeight: FontWeight.w600),
          ),
          Container(
            width: 45.w,
          )
        ],
      ),
    );
  }
}
