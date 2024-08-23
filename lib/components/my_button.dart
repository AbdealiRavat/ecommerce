import 'package:ecommerce_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final bool isLoading;
  const MyButton({
    super.key,
    required this.onTap,
    required this.text,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      onTap: onTap,
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 5.w),
          margin: EdgeInsets.symmetric(vertical: 10.h),
          decoration: BoxDecoration(color: primaryColor, borderRadius: BorderRadius.circular(25.r)),
          child: Center(
            child: isLoading
                ? CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 3,
                  )
                : Text(
                    text,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16.sp),
                  ),
          )),
    );
  }
}
