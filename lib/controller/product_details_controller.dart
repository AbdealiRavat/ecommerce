import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../utils/colors.dart';

class ProductDetailsController extends GetxController {
  RxBool textHidden = true.obs;
  RxBool addedToCart = false.obs;

  RxInt sizeIndex = 0.obs;
  RxList sizeList = [].obs;
  RxInt colorIndex = 0.obs;
  RxList colorList = [].obs;

  size() {
    sizeList.value = ['S', 'M', 'L', 'XL', 'XXL', 'XXXL'];
  }

  colors() {
    colorList.value = [
      {'color': primaryColor, 'name': 'Brown'},
      {'color': Color(0xffB9773B), 'name': 'Beige'},
      {'color': Color(0xffB17552), 'name': 'Dark brown'},
      {'color': Color(0xffB17552), 'name': 'Autumn brown'},
      {'color': Color(0xffD99567), 'name': 'Light brown'},
    ];
  }
}
