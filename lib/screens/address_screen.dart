import 'package:ecommerce_app/controller/cart_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../utils/colors.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  CartController cartController = Get.put(CartController());

  @override
  void initState() {
    cartController.addressListItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 20.w),
        children: [
          myAppbar(() {}),
          ListView.builder(
              shrinkWrap: true,
              itemCount: cartController.addressList.length,
              itemBuilder: (context, index) {
                return Obx(() => listTile(index));
              }),
          buttonCard(primaryColor, '+ Add New Address', txtColor, (){})
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
            'Shipping Address',
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

  Widget listTile(index) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
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
                    cartController.addressList[index]['title'],
                    style: TextStyle(color: primaryColor, fontSize: 18.sp),
                  ),
                  Text(
                    cartController.addressList[index]['address'],
                    style: TextStyle(color: txtColor, fontSize: 16.sp),
                  ),
                ],
              )
            ],
          ),
          Obx(() => InkWell(
                onTap: () {
                  cartController.addressList[index]['isSelected'] =
                      !cartController.addressList[index]['isSelected'];
                  print(cartController.addressList[index]['isSelected']);
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.w),
                  padding: EdgeInsets.all(6.h),
                  decoration: BoxDecoration(
                    border: Border.all(color: primaryColor),
                    shape: BoxShape.circle,
                    color: white,
                  ),
                  child: Container(
                    // height: 20.h,
                    // width: 20.h,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(8.h),
                    decoration: BoxDecoration(
                      color: cartController.addressList[index]['isSelected'] ? primaryColor : white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ))
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
}
