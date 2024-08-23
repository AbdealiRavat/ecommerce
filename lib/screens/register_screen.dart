import 'package:ecommerce_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../components/my_button.dart';
import '../components/my_text_field.dart';
import '../controller/auth_controller.dart';
import '../utils/colors.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  FocusNode usernameFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode confirmPasswordFocusNode = FocusNode();

  AuthController authController = Get.put(AuthController());
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
            Text('Create Account',
                style: TextStyle(color: black, fontSize: 25.sp), textAlign: TextAlign.center),
            Text('Fill your information below',
                style: TextStyle(color: primaryColor), textAlign: TextAlign.center),
            SizedBox(
              height: 25.h,
            ),
            Text('Name', style: TextStyle(fontSize: 14.sp)),
            MyTextField(
                controller: usernameController,
                hintText: 'Enter Username',
                focusNode: usernameFocusNode,
                focusChange: () {
                  usernameFocusNode.unfocus();
                  FocusScope.of(context).requestFocus(emailFocusNode);
                },
                tColor: primaryColor,
                obscureText: false,
                isHidden: false,
                isPassword: false),
            SizedBox(
              height: 16.h,
            ),
            Text('Email', style: TextStyle(fontSize: 14.sp)),
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
            Text('Password', style: TextStyle(fontSize: 14.sp)),
            MyTextField(
                controller: passwordController,
                hintText: 'Enter Password',
                focusNode: passwordFocusNode,
                focusChange: () {
                  passwordFocusNode.unfocus();
                  FocusScope.of(context).requestFocus(confirmPasswordFocusNode);
                },
                tColor: primaryColor,
                obscureText: true,
                isHidden: true,
                isPassword: true),
            SizedBox(
              height: 16.h,
            ),
            Text('Confirm Password', style: TextStyle(fontSize: 14.sp)),
            MyTextField(
                controller: confirmPasswordController,
                hintText: 'Enter Password',
                focusNode: confirmPasswordFocusNode,
                focusChange: () {
                  confirmPasswordFocusNode.unfocus();
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

            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Row(
                children: [
                  Obx(() => InkWell(
                        splashFactory: NoSplash.splashFactory,
                        onTap: () {
                          authController.isAccepted.value = !authController.isAccepted.value;
                        },
                        child: Icon(
                          authController.isAccepted.value
                              ? Icons.check_box
                              : Icons.check_box_outline_blank,
                          color: primaryColor,
                        ),
                      )),
                  SizedBox(width: 8.w),
                  Text(
                    'Agree with ',
                    style: TextStyle(color: Colors.black, fontSize: 14.sp),
                  ),
                  Text(
                    'Terms & Conditions',
                    style: TextStyle(
                        color: primaryColor, fontSize: 14.sp, decoration: TextDecoration.underline),
                  ),
                ],
              ),
            ),
            Obx(() => MyButton(
                onTap: () {
                  final email = emailTextController.text.trim();
                  final password = passwordController.text;
                  final confirmPassword = confirmPasswordController.text;

                  authController.isEmailEmpty.value = email.isEmpty;
                  authController.isPasswordEmpty.value = password.isEmpty;

                  if (email.isNotEmpty &&
                      password.isNotEmpty &&
                      (password == confirmPassword) &&
                      authController.isAccepted.value) {
                    authController.signUp(
                        context,
                        usernameController.text,
                        emailTextController.text,
                        passwordController.text,
                        confirmPasswordController.text,
                        authController.isAccepted.value);
                  }
                },
                text: 'Sign Up  ',
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
                        Get.to(() => LoginScreen());
                        // Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => RegisterPage()),
                        // );
                      },
                      child: Text('Sign In',
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
