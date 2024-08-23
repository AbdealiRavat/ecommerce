// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommerce_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemsCard extends StatelessWidget {
  String title;
  String image;
  String price;
  String rating;
  bool isLiked;
  ItemsCard({
    super.key,
    required this.title,
    required this.image,
    required this.price,
    required this.rating,
    required this.isLiked,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 165.w,
          height: 300.h,
          padding: EdgeInsets.all(4.w),
          decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(15.r),
              boxShadow: [BoxShadow(color: grey.withOpacity(0.5), spreadRadius: 1, offset: Offset(1, 1), blurRadius: 1)]),
          margin: EdgeInsets.all(5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.r),
                child: Image.asset(
                  'asset/cloths/$image.jpg',
                  fit: BoxFit.cover,
                  height: 165.w,
                  width: 165.w,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: txtColor,
                      fontSize: 14.sp,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: ratings,
                        size: 18.w,
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      Text(
                        rating,
                        style: TextStyle(fontSize: 14.sp, color: txtColor),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                '\$$price',
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700, color: txtColor),
              )
            ],
          ),
        ),
        Positioned(
          left: 125.w,
          top: 15.h,
          child: Container(
            height: 35.h,
            width: 35.w,
            padding: EdgeInsets.all(6.w),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: secondaryColor.withOpacity(0.5),
            ),
            child: Image.asset(
              isLiked ? 'asset/navbar/heart1.png' : 'asset/navbar/heart.png',
              color: primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
