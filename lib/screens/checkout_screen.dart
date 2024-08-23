import 'package:ecommerce_app/screens/address_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controller/cart_controller.dart';
import '../utils/colors.dart';

class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({super.key});

  CartController cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        ListView(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
          children: [
            myAppbar(() {}),
            SizedBox(
              height: 20.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Shipping Address',
                  style: TextStyle(color: txtColor, fontSize: 18.sp),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.location_pin),
                        SizedBox(
                          width: 10.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Home',
                              style: TextStyle(color: primaryColor, fontSize: 18.sp),
                            ),
                            Text(
                              'Ahmedabad, Gujarat',
                              style: TextStyle(color: txtColor, fontSize: 16.sp),
                            ),
                          ],
                        )
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => AddressScreen());
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                        decoration: BoxDecoration(
                            border: Border.all(color: secondaryColor),
                            borderRadius: BorderRadius.circular(25.r)),
                        child: Text(
                          'CHANGE',
                          style: TextStyle(color: primaryColor, fontSize: 14.sp),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
            Divider(
              color: secondaryColor,
              height: 20.h,
            ),
            Text(
              'Order List',
              style: TextStyle(color: txtColor, fontSize: 18.sp),
            ),
            SizedBox(height: 10.h),
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: cartController.cartList.length,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return listTile(index);
                }),
            SizedBox(
              height: 100.h,
            )
          ],
        ),
        Positioned(
            bottom: 0,
            child: Container(
                height: 80.h,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(color: secondaryColor.withOpacity(0.5), spreadRadius: 4, blurRadius: 3)
                ], color: white, borderRadius: BorderRadius.vertical(top: Radius.circular(25.r))),
                child: buttonCard(primaryColor, 'Continue to Payment', white, () {})))
      ],
    ));
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
            'Checkout',
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

  Widget buttonCard(Color color, String txt, Color txtColor, onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 15.h, horizontal: 25.w),
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
        ],
      ),
    );
  }
}
