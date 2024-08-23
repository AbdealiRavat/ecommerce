// ignore_for_file: prefer_const_constructors

import 'package:ecommerce_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ProductController extends GetxController {
  RxInt itemIndex = 0.obs;
  RxList productsList = [].obs;
  RxBool isSelected = false.obs;

  products() {
    productsList.value = [
      {
        'title': 'Brown Jacket',
        'image': '4',
        'price': '95.45',
        'rating': '4.4',
        'isLiked': false,
        'inCart': false
      },
      {
        'title': 'Beige T-Shirt',
        'image': '8',
        'price': '65.45',
        'rating': '3.9',
        'isLiked': true,
        'inCart': false
      },
      {
        'title': 'Brown Shirt',
        'image': '6',
        'price': '75.45',
        'rating': '4.3',
        'isLiked': false,
        'inCart': false
      },
      {
        'title': 'Beige Jacket',
        'image': '2',
        'price': '55.45',
        'rating': '4.6',
        'isLiked': true,
        'inCart': false
      },
      {
        'title': 'White Shirt',
        'image': '10',
        'price': '88.45',
        'rating': '3.8',
        'isLiked': false,
        'inCart': false
      },
    ];
  }
}
