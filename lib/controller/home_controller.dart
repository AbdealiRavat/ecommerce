// ignore_for_file: prefer_const_constructors

import 'package:ecommerce_app/screens/cart_screen.dart';
import 'package:ecommerce_app/screens/chat_screen.dart';
import 'package:ecommerce_app/screens/profile/profile_screen.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../screens/home_screen.dart';
import '../screens/whishlist_screen.dart';

class HomeController extends GetxController {
  RxInt bannerIndex = 0.obs;
  RxInt pageIndex = 0.obs;
  RxInt tabIndex = 0.obs;
  RxList pageList = [].obs;
  RxList categoryList = [].obs;
  RxList tabList = [].obs;
  RxList searchList = [].obs;
  RxList searchResults = [].obs;
  RxBool isSelected = false.obs;

  pages() {
    pageList.value = [
      [HomeScreen(), 'home', 'home1'],
      [CartScreen(), 'bag', 'bag1'],
      [WishListScreen(), 'heart', 'heart1'],
      [ChatScreen(), 'chat', 'chat1'],
      [ProfileScreen(), 'profile', 'profile1']
    ];
  }

  categories() {
    categoryList.value = [
      't-shirt',
      'pants',
      'dress',
      'jacket',
    ];
  }

  tabs() {
    tabList.value = [
      'All',
      'Newest',
      'Popular',
      'Man',
      'Women',
    ];
  }

  search() {
    searchList.value = [
      'Black Jeans',
      'Brown Shirt',
      'Beige Pants',
      'Brown Shirt',
      'Beige Pants',
      'Brown Shirt',
      'Beige Pants',
      'White Sweatshirt',
    ];
  }
}
