import 'package:ecommerce_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddProducts extends StatefulWidget {
  const AddProducts({super.key});

  @override
  State<AddProducts> createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  TextEditingController controller = TextEditingController();
  FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          textField(controller, focusNode, () {
            focusNode.unfocus();
          }, 'id')
        ],
      ),
    );
  }

  Widget textField(controller, focusNode, focusChange, hintText) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 25.w),
      // padding: EdgeInsets.symmetric(horizontal: 20.w),
      // height: 55.h,
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        onEditingComplete: () {
          focusChange!();
        },
        style: TextStyle(fontSize: 15.sp, color: primaryColor),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
            hintText: hintText,
            // suffixIcon: InkWell(
            //     onTap: () {
            //       setState(() {
            //          isHidden = ! isHidden;
            //       });
            //     },
            //     child: Icon( isHidden ? Icons.visibility : Icons.visibility_off_rounded,
            //         color:  isPassword ? primaryColor : Colors.transparent)),

            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor.withOpacity(0.2)),
                borderRadius: BorderRadius.circular(35.r)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor, width: 1.2),
                borderRadius: BorderRadius.circular(35.r)),
            hintStyle: TextStyle(fontSize: 15.sp, color: Colors.grey[500])),
      ),
    );
  }
}
