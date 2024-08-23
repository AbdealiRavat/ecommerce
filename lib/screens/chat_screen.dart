import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/colors.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 20.w),
        children: [myAppbar(() {})],
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
            'Chat Screen',
            style: TextStyle(
                color: txtColor.withOpacity(0.8), fontSize: 18.sp, fontWeight: FontWeight.w600),
          ),
          Container(
            width: 45.w,
          ),
        ],
      ),
    );
  }
}
