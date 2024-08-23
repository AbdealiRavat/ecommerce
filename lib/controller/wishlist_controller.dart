// ignore_for_file: prefer_const_constructors

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class WishlistController extends GetxController {
  RxInt categoryIndex = 0.obs;
  RxInt wishListIndex = 0.obs;
  RxList wishList = [].obs;
  RxList categoryList = [].obs;
  RxBool isSelected = false.obs;

  wishListItems() {
    wishList.value = [
      {'title': 'Brown Jacket', 'type': 0, 'image': '4', 'price': '95.45', 'rating': '4.4', 'isLiked': true},
      {'title': 'Beige T-Shirt', 'type': 1, 'image': '8', 'price': '65.45', 'rating': '3.9', 'isLiked': true},
      {'title': 'Brown Shirt', 'type': 2, 'image': '6', 'price': '75.45', 'rating': '4.3', 'isLiked': true},
      {'title': 'Beige Jacket', 'type': 3, 'image': '2', 'price': '55.45', 'rating': '4.6', 'isLiked': true},
      {'title': 'White Shirt', 'type': 2, 'image': '10', 'price': '88.45', 'rating': '3.8', 'isLiked': true},
      {'title': 'White Shirt', 'type': 3, 'image': '9', 'price': '88.45', 'rating': '3.8', 'isLiked': true},
      {'title': 'White Shirt', 'type': 1, 'image': '7', 'price': '88.45', 'rating': '3.8', 'isLiked': true},
    ];
  }

  categories() {
    categoryList.value = [
      'All',
      'Jackets',
      'Shirt',
      'Pant',
      'T-shirt',
    ];
  }
}
