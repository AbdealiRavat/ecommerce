import 'package:ecommerce_app/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchTextField extends StatelessWidget {
  Function(String)? onQueryChanged;
  TextEditingController controller;
  SearchTextField({super.key, required this.onQueryChanged, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      padding: EdgeInsets.all(5.w),
      decoration: BoxDecoration(
          border: Border.all(color: secondaryColor), borderRadius: BorderRadius.circular(20.r)),
      child: Row(
        children: [
          Image.asset(
            'asset/search.png',
            height: 25.h,
            color: primaryColor,
          ),
          SizedBox(
            width: 220.w,
            child: TextField(
              style: TextStyle(color: txtColor, fontSize: 18.sp),
              onChanged: onQueryChanged,
              controller: controller,
              decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(color: primaryColor.withOpacity(0.6), fontSize: 18.sp),
                  border: const OutlineInputBorder(borderSide: BorderSide.none),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h)
                  //     OutlineInputBorder(borderRadius: BorderRadius.circular(15.r), borderSide: BorderSide(color: Colors.brown))
                  ),
            ),
          ),
          controller.text.isNotEmpty
              ? Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.w),
                    child: InkWell(
                      radius: 10.w,
                      borderRadius: BorderRadius.circular(20.r),
                      onTap: () {
                        controller.clear();
                      },
                      child: Icon(
                        Icons.close,
                        size: 20.w,
                      ),
                    ),
                  ),
                )
              : SizedBox()
        ],
      ),
    );
  }
}
