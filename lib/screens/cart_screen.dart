import 'package:ecommerce_app/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../utils/colors.dart';
import 'checkout_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  CartController cartController = Get.put(CartController());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 20.w),
        children: [
          myAppbar(() {}),
          Container(
            child: Obx(() => ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: cartController.cartList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Dismissible(
                        key: UniqueKey(),
                        direction: DismissDirection.endToStart,
                        dismissThresholds: const {DismissDirection.endToStart: 0.1},
                        onUpdate: (details) {
                          // print(details.progress);
                        },
                        confirmDismiss: (direction) async {
                          final response = await showModalBottomSheet(
                              context: context,
                              elevation: 2,
                              builder: (context) {
                                return bottomSheet(index);
                              });
                          return response;
                        },
                        onDismissed: (direction) {},
                        background: Container(
                          decoration: BoxDecoration(
                              color: deleteAccent, borderRadius: BorderRadius.circular(8)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                child: Icon(
                                  Icons.delete,
                                  size: 30.w,
                                  color: delete,
                                ),
                              ),
                            ],
                          ),
                        ),
                        child: listTile(index),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      index == cartController.cartList.length - 1
                          ? Container()
                          : Divider(
                              color: primaryColor.withOpacity(0.3),
                              height: 1,
                            ),
                      SizedBox(
                        height: 10.h,
                      ),
                    ],
                  );
                })),
          ),
          Divider(
            height: 30.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Cost',
                  style: TextStyle(fontSize: 16.sp),
                ),
                Text(
                  '\$23.33',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.sp),
                )
              ],
            ),
          ),
          buttonCard(primaryColor, 'Proceed to Checkout', white, () {
            Get.to(() => CheckoutScreen());
          }),
          SizedBox(
            height: 120.h,
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
              // homeController.pageIndex.value = 0;
              // Get.to(() => Home());
            },
            child: Container(
              height: 45.h,
              width: 45.w,
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(shape: BoxShape.circle, color: white, boxShadow: [
                BoxShadow(
                    color: grey.withOpacity(0.5),
                    spreadRadius: 1,
                    offset: const Offset(1, 1),
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
            'My Cart',
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

  Widget bottomSheet(index) {
    return Container(
      decoration: BoxDecoration(
          color: white, borderRadius: BorderRadius.vertical(top: Radius.circular(25.r))),
      height: MediaQuery.sizeOf(context).height * 0.35,
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 20.w),
      child: Column(
        children: [
          Text(
            'Remove from Cart?',
            style: TextStyle(color: txtColor, fontSize: 20.sp, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 10.h),
          Divider(color: primaryColor.withOpacity(0.3), height: 1),
          SizedBox(height: 10.h),
          listTile(index),
          SizedBox(height: 15.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: buttonCard(grey, 'Cancel', primaryColor, () {
                Get.back(result: false);
              })),
              SizedBox(
                width: 10.w,
              ),
              Expanded(
                  child: buttonCard(primaryColor, 'Yes, Remove', grey, () {
                cartController.cartList.removeAt(index);
                Get.back(result: true);
              })),
            ],
          )
        ],
      ),
    );
  }

  Widget buttonCard(Color color, String txt, Color txtColor, onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(50.r)),
        alignment: Alignment.center,
        child: Text(
          txt,
          style: TextStyle(fontSize: 18.sp, color: txtColor, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  Widget listTile(index) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.r),
                child: Image.asset(
                  'asset/cloths/${cartController.cartList[index]['image']}.jpg',
                  fit: BoxFit.cover,
                  height: 85.w,
                  width: 85.w,
                ),
              ),
              SizedBox(
                width: 15.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cartController.cartList[index]['title'],
                    style: TextStyle(
                      color: txtColor,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Size: M',
                    style: TextStyle(
                      color: txtColor,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  Text(
                    '\$${cartController.cartList[index]['price']}',
                    style: TextStyle(
                      color: txtColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              )
            ],
          ),
          Row(
            children: [
              InkWell(
                onTap: () {
                  if (cartController.itemCount.value > 1) {
                    cartController.itemCount.value--;
                  }
                },
                splashFactory: NoSplash.splashFactory,
                child: Container(
                    margin: EdgeInsets.all(10.w),
                    decoration: BoxDecoration(
                        color: secondaryColor, borderRadius: BorderRadius.circular(8.r)),
                    alignment: Alignment.center,
                    width: 28.w,
                    height: 28.w,
                    child: Icon(
                      Icons.remove,
                      color: primaryColor,
                      size: 15.w,
                    )),
              ),
              Obx(() => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.w),
                    child: Text(
                      cartController.itemCount.value.toString(),
                      style: TextStyle(color: txtColor, fontSize: 15.sp),
                    ),
                  )),
              InkWell(
                onTap: () {
                  if (cartController.itemCount.value < 5) {
                    cartController.itemCount.value++;
                  }
                },
                splashFactory: NoSplash.splashFactory,
                child: Container(
                    margin: EdgeInsets.all(10.w),
                    decoration: BoxDecoration(
                        color: primaryColor, borderRadius: BorderRadius.circular(8.r)),
                    alignment: Alignment.center,
                    width: 28.w,
                    height: 28.w,
                    child: Icon(
                      Icons.add,
                      color: white,
                      size: 15.w,
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
