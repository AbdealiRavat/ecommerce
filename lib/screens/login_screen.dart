import 'package:ecommerce_app/controller/auth_controller.dart';
import 'package:ecommerce_app/controller/home_controller.dart';
import 'package:ecommerce_app/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../components/my_button.dart';
import '../components/my_text_field.dart';
import '../utils/colors.dart';

class LoginScreen extends StatefulWidget {
  // final Function()? onTap;
  const LoginScreen({
    super.key,
    //  required this.onTap
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailTextController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  AuthController authController = Get.put(AuthController());

  @override
  void initState() {
    Future.microtask(() {
      // Constants.initializePref();
      // authController.errorMessage.value = '';
      // authController.isPasswordEmpty.value = false;
      //
      // authController.isEmailEmpty.value = false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 35.w),
          children: [
            SizedBox(
              height: 25.h,
            ),
            Text('Sign In',
                style: TextStyle(color: black, fontSize: 25.sp), textAlign: TextAlign.center),
            Text('Hi, Welcome back',
                style: TextStyle(color: primaryColor), textAlign: TextAlign.center),
            SizedBox(
              height: 25.h,
            ),
            Text(
              'Email',
              style: TextStyle(fontSize: 14.sp),
            ),
            MyTextField(
                controller: emailTextController,
                hintText: 'Enter Email',
                focusNode: emailFocusNode,
                focusChange: () {
                  emailFocusNode.unfocus();
                  FocusScope.of(context).requestFocus(passwordFocusNode);
                },
                tColor: primaryColor,
                obscureText: false,
                isHidden: false,
                isPassword: false),
            SizedBox(
              height: 16.h,
            ),
            Text(
              'Password',
              style: TextStyle(fontSize: 14.sp),
            ),
            MyTextField(
                controller: passwordController,
                hintText: 'Enter Password',
                focusNode: passwordFocusNode,
                focusChange: () {
                  passwordFocusNode.unfocus();
                },
                tColor: primaryColor,
                obscureText: true,
                isHidden: true,
                isPassword: true),
            // Obx(() => Padding(
            //       padding: EdgeInsets.only(top: 3.h),
            //       child: Center(
            //         child: Text(
            //           authController.isEmailEmpty.value
            //               ? 'Enter Valid Email'
            //               : authController.isPasswordEmpty.value
            //                   ? 'Enter Password'
            //                   : authController.errorMessage.value.isNotEmpty
            //                       ? "Invalid User Credentials "
            //                       : '',
            //           style: TextStyle(
            //             color: Colors.amberAccent,
            //             fontSize: 12.sp,
            //           ),
            //         ),
            //       ),
            //     )),
            Text(
              'Forgot Password?',
              textAlign: TextAlign.right,
              style: TextStyle(
                  color: primaryColor, fontSize: 14.sp, decoration: TextDecoration.underline),
            ),
            Obx(() => MyButton(
                onTap: () {
                  final email = emailTextController.text.trim();
                  final password = passwordController.text;

                  authController.isEmailEmpty.value = email.isEmpty;
                  authController.isPasswordEmpty.value = password.isEmpty;

                  if (email.isNotEmpty && password.isNotEmpty) {
                    authController.signIn(
                        context, emailTextController.text, passwordController.text);
                  }
                },
                text: 'Sign In',
                isLoading: authController.isLoading.value)),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an account?',
                      style: TextStyle(fontSize: 16.sp, color: Colors.black)),
                  SizedBox(
                    width: 10.w,
                  ),
                  InkWell(
                      onTap: () {
                        Get.to(() => RegisterScreen());
                      },
                      child: Text('Sign Up',
                          style: TextStyle(
                              color: primaryColor, fontSize: 16.sp, fontWeight: FontWeight.w700))),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
