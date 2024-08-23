import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../utils/colors.dart';

class PaymentMethodsScreen extends StatelessWidget {
  const PaymentMethodsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
        children: [
          myAppbar(() {}),
          SizedBox(
            height: 30.h,
          ),
          Text(
            'Credit & Debit Cards',
            style: TextStyle(color: txtColor, fontWeight: FontWeight.w400, fontSize: 20.sp),
          ),
          SizedBox(
            height: 10.h,
          ),
          myListTile('Add New Card', 'card', 25, () {}),
          SizedBox(
            height: 18.h,
          ),
          Text(
            'More Payment Options',
            style: TextStyle(color: txtColor, fontWeight: FontWeight.w400, fontSize: 20.sp),
          ),
          SizedBox(
            height: 10.h,
          ),
          myListTile('PayPal', 'card', 25, () {}),
          myListTile('Amazon Pay', 'card', 23, () {})
        ],
      ),
    );
  }

  Widget myAppbar(onTap) {
    return Container(
      margin: EdgeInsets.only(
        top: 30.h,
      ),
      // padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              // homeController.pageIndex.value = 0;
              Get.back();
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
            'Payment Methods',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: txtColor.withOpacity(0.8), fontSize: 18.sp, fontWeight: FontWeight.w600),
          ),
          Container(
            width: 50.w,
          )
        ],
      ),
    );
  }

  myListTile(String txt, String icon, int height, Function()? onTap) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
      ),
      child: InkWell(
        onTap: onTap,
        splashFactory: NoSplash.splashFactory,
        splashColor: Colors.transparent,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 2,
                    offset: Offset(2, 2),
                    spreadRadius: 1.2)
              ],
              border: Border.all(color: primaryColor.withOpacity(0.5), width: 0.2),
              borderRadius: BorderRadius.circular(12.r)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    'asset/icons/$icon.png',
                    color: primaryColor,
                    height: height.h,
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Text(
                    txt,
                    style: TextStyle(
                        color: txtColor.withOpacity(0.5),
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp),
                  ),
                ],
              ),
              Text(
                'Link',
                style: TextStyle(color: primaryColor, fontWeight: FontWeight.w300, fontSize: 16.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
