import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/screens/home.dart';
import 'package:ecommerce_app/screens/home_screen.dart';
import 'package:ecommerce_app/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../models/user_model.dart';

class AuthController extends GetxController {
  RxBool isEmailEmpty = false.obs;
  RxBool isPasswordEmpty = false.obs;
  RxBool isLoading = false.obs;
  RxBool isAccepted = false.obs;
  RxString errorMessage = ''.obs;

  signIn(context, email, password) async {
    isLoading(true);
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email.trim(), password: password.trim())
          .then((value) {
        Get.to(() => Home());
        isLoading(false);
      });
    } on FirebaseAuthException catch (e) {
      isLoading(false);
      print(e.message);
      errorMessage.value = e.message.toString();
    }
  }

  signUp(context, name, email, password, confirmPassword, isAccepted) async {
    isLoading(true);
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email.trim(), password: password.trim());
      UserModel userData = UserModel(
        id: FirebaseAuth.instance.currentUser!.uid,
        userName: name,
        bio: '',
        email: email.trim(),
        password: password.trim(),
        profileImg: '',
        fcmToken: '',
        isAccepted: isAccepted,
        timeStamp: DateTime.now().toString(),
      );
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set(userData.toJson())
          .then((value) {
        isLoading(false);
        Get.offAll(() => const LoginScreen());
      });
    } on FirebaseAuthException catch (e) {
      isLoading(false);
      print(e.message);
      errorMessage.value = e.message.toString();
    }
  }

  signOut(context) async {
    await FirebaseAuth.instance.signOut();
    Get.offAll(() => const LoginScreen());
  }
}
