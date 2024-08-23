import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../utils/colors.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

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
          myListTile('Notification Setting', 'profile', 25, () {}),
          myListTile('Password Manager', 'lock', 25, () {}),
          myListTile('Delete Account', 'card', 23, () {})
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
            'Settings',
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
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      child: InkWell(
        onTap: onTap,
        splashFactory: NoSplash.splashFactory,
        splashColor: Colors.transparent,
        child: Column(
          children: [
            Row(
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
                          color: txtColor.withOpacity(0.8),
                          fontWeight: FontWeight.w400,
                          fontSize: 18.sp),
                    ),
                  ],
                ),
                Icon(Icons.arrow_forward_ios, color: primaryColor.withOpacity(0.5), size: 22.w),
              ],
            ),
            Divider(
              height: 22.h,
              color: txtColor.withOpacity(0.05),
            ),
          ],
        ),
      ),
    );
  }
}
