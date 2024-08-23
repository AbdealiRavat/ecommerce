// ignore_for_file: prefer_const_constructors

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CartController extends GetxController {
  // RxInt wishListIndex = 0.obs;
  RxList cartList = [].obs;
  RxList addressList = [].obs;
  RxInt itemCount = 1.obs;

  addressListItems() {
    addressList.value = [
      {'title': 'Home', 'address': 'Ahmedabad,Gujarat', 'isSelected': true},
      {'title': 'Office', 'address': 'Surat,,Gujarat', 'isSelected': false},
      {'title': 'Home 2', 'address': 'Mumbai, Maharashtra', 'isSelected': false},
    ];
  }
}
