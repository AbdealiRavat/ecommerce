import 'package:ecommerce_app/controller/auth_controller.dart';
import 'package:ecommerce_app/screens/profile/add_products.dart';
import 'package:ecommerce_app/screens/profile/payment_methods_screen.dart';
import 'package:ecommerce_app/screens/profile/settings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
        children: [
          myAppbar(() {}),
          SizedBox(
            height: 30.h,
          ),
          Center(
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                    width: 120.h,
                    height: 120.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: secondaryColor, shape: BoxShape.circle),
                    child: Image.asset(
                      'asset/navbar/profile1.png',
                      height: 55.h,
                    )),
                Container(
                  padding: EdgeInsets.all(5.w),
                  decoration: BoxDecoration(shape: BoxShape.circle, color: primaryColor),
                  child: Icon(
                    Icons.edit,
                    color: white,
                    size: 22.w,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            'John Doe',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: txtColor.withOpacity(0.8), fontWeight: FontWeight.w400, fontSize: 18.sp),
          ),
          SizedBox(
            height: 30.h,
          ),
          myListTile('Your profile', 'profile', 25, () {}),
          myListTile(
              'Payment Methods', 'card', 24, () => Get.to(() => const PaymentMethodsScreen())),
          myListTile('My Orders', 'orders', 22, () {}),
          myListTile('Settings', 'setting', 24, () => Get.to(() => const SettingsScreen())),
          myListTile('Help Center', 'info', 24, () {}),
          myListTile('Privacy Policy', 'lock', 25, () {}),
          myListTile('Add Products', 'orders', 22, () => Get.to(() => const AddProducts())),
          myListTile('Log out', 'exit', 23, () {
            print('tapp');
            showBottomSheet();
          }),
          SizedBox(
            height: 150.h,
          )
        ],
      ),
    );
  }

  showBottomSheet() {
    return showModalBottomSheet(
        useSafeArea: true,
        context: context,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20.r))),
        builder: (context) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
            height: MediaQuery.sizeOf(context).height / 3.8,
            child: Column(
              children: [
                Divider(indent: 120.w, endIndent: 120.w, thickness: 3),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  'Logout',
                  style: TextStyle(color: txtColor, fontSize: 18.sp, fontWeight: FontWeight.w600),
                ),
                Divider(),
                Text(
                  'Are you sure you want to log out?',
                  style: TextStyle(color: txtColor.withOpacity(0.8), fontSize: 18.sp),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: button(() {
                      Get.back();
                    }, 'Cancel', primaryColor, Colors.transparent, primaryColor)),
                    Expanded(
                        child: button(() {
                      authController.signOut(context);
                    }, 'Yes, Logout', white, primaryColor, primaryColor))
                  ],
                ),
              ],
            ),
          );
        });
  }

  Widget button(onTap, text, textColor, bgColor, borderColor) {
    return InkWell(
      onTap: onTap,
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          margin: EdgeInsets.all(10.w),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(30.r),
              border: Border.all(color: borderColor)),
          child: Text(
            text,
            style: TextStyle(color: textColor, fontSize: 18.sp),
          )),
    );
  }

  Widget myAppbar(onTap) {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      // padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // InkWell(
          //   onTap: () {
          //     // homeController.pageIndex.value = 0;
          //     // Get.back();
          //   },
          //   child: Container(
          //     height: 45.h,
          //     width: 45.w,
          //     padding: EdgeInsets.all(10.w),
          //     decoration: BoxDecoration(shape: BoxShape.circle, color: white, boxShadow: [
          //       BoxShadow(
          //           color: grey.withOpacity(0.5),
          //           spreadRadius: 1,
          //           offset: Offset(1, 1),
          //           blurRadius: 1)
          //     ]),
          //     child: Icon(
          //       Icons.arrow_back,
          //       color: primaryColor,
          //     ),
          //   ),
          // ),
          Text(
            // homeController.cityName.value,
            'Profile',
            style: TextStyle(
                color: txtColor.withOpacity(0.8), fontSize: 18.sp, fontWeight: FontWeight.w600),
          ),
          // Container(
          //   height: 50.w,
          // ),
        ],
      ),
    );
  }

  Widget myListTile(String txt, String icon, int height, Function()? onTap) {
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
