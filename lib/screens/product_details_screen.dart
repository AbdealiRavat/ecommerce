import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/controller/cart_controller.dart';
import 'package:ecommerce_app/controller/product_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

import '../controller/home_controller.dart';
import '../controller/products_controller.dart';
import '../utils/colors.dart';

class ProductDetailsScreen extends StatefulWidget {
  int index;
  List data;
  ProductDetailsScreen({
    super.key,
    required this.index,
    required this.data,
  });

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> with TickerProviderStateMixin {
  CarouselSliderController carouselController = CarouselSliderController();
  HomeController homeController = Get.put(HomeController());
  ProductController productController = Get.put(ProductController());
  ProductDetailsController productDetailsController = Get.put(ProductDetailsController());
  CartController cartController = Get.find();
  late TabController tabController;
  late TabController tabController1;
  @override
  void initState() {
    super.initState();
    productDetailsController.size();
    productDetailsController.colors();
    tabController = TabController(
        length: productDetailsController.sizeList.length, vsync: this, initialIndex: 0);
    tabController1 = TabController(
        length: productDetailsController.colorList.length, vsync: this, initialIndex: 0);
    productDetailsController.sizeIndex.value = 0;
    productDetailsController.colorIndex.value = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
            statusBarColor: secondaryColor, statusBarIconBrightness: Brightness.dark),
        child: Stack(
          children: [
            Obx(() => ListView(
                  shrinkWrap: true,
                  children: [
                    Stack(
                      children: [
                        CarouselSlider.builder(
                          itemCount: 3,
                          carouselController: carouselController,
                          options: CarouselOptions(
                            initialPage: 0,
                            enableInfiniteScroll: false,
                            disableCenter: true,
                            onPageChanged: (index, reason) {
                              productController.itemIndex.value = index;
                            },
                            height: 400.h,
                            viewportFraction: 1,
                          ),
                          itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
                              Container(
                            margin: EdgeInsets.only(
                                left: itemIndex == 2 ? 5.w : 0, right: itemIndex == 0 ? 5.w : 0),
                            width: double.maxFinite,
                            child: Image.asset(
                              'asset/cloths/${widget.data[widget.index]['image']}.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Positioned(
                          bottom: 10.h,
                          left: 0.w,
                          right: 0.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List<Widget>.generate(
                                3,
                                (index) => Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                                      child: Container(
                                        height: 10.w,
                                        width: 10.w,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: productController.itemIndex.value == index
                                                ? primaryColor.withOpacity(0.8)
                                                : secondaryColor),
                                      ),
                                    )),
                          ),
                        ),
                        myAppbar(() {}),
                      ],
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 25.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Male\'s Style',
                                style: TextStyle(
                                  color: txtColor,
                                  fontSize: 16.sp,
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: ratings,
                                    size: 20.w,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    widget.data[widget.index]['rating'],
                                    style: TextStyle(fontSize: 16.sp, color: txtColor),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            widget.data[widget.index]['title'],
                            style: TextStyle(
                                color: txtColor, fontSize: 22.sp, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 18.h),
                          Text(
                            'Product Details',
                            style: TextStyle(
                                color: txtColor, fontSize: 18.sp, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 10.h),
                          // Obx(
                          //   () => Column(
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: [
                          //       Text(
                          //         'Lorem ipsum dolor sit amet. Ut ipsum doloribus ab minus nostrum eum nobisLor ipsum doloribusnobisLor ipsum doloribusnobisLor ipsum doloribusnobisLor ipsum doloribus ab minus nostrum eum nobisLorem ipsum dolor sit amet. Ut ipsum doloribus ab minus nostrum eum nobisLorem ipsum dolor sit amet. Ut ipsum doloribus ab minus nostrum eum nobis molestiae.nesciunt aperiam et adipisci!',
                          //         maxLines:
                          //             productDetailsController.textHidden.value == true ? 4 : null,
                          //         overflow: productDetailsController.textHidden.value == true
                          //             ? TextOverflow.ellipsis
                          //             : TextOverflow.visible,
                          //         style: TextStyle(
                          //           color: txtColor.withOpacity(0.8),
                          //           fontSize: 15.sp,
                          //         ),
                          //       ),
                          //       InkWell(
                          //         onTap: () {
                          //           productDetailsController.textHidden.value =
                          //               !productDetailsController.textHidden.value;
                          //         },
                          //         child: Text(
                          //           productDetailsController.textHidden.value == true
                          //               ? 'more'
                          //               : 'less',
                          //           style: TextStyle(
                          //             decoration: TextDecoration.underline,
                          //             color: primaryColor,
                          //             fontWeight: FontWeight.w500,
                          //           ),
                          //         ),
                          //       )
                          //     ],
                          //   ),
                          // ),
                          ReadMoreText(
                            'Lorem ipsum dolor sit amet. Ut ipsum doloribus ab minus nostrum eum nobisLor ipsum doloribusnobisLor ipsum doloribusnobisLor ipsum doloribusnobisLor ipsum doloribus ab minus nostrum eum nobisLorem ipsum dolor sit amet. Ut ipsum doloribus ab minus nostrum eum nobisLorem ipsum dolor sit amet. Ut ipsum doloribus ab minus nostrum eum nobis molestiae.nesciunt aperiam et adipisci!',
                            trimLines: 4,
                            colorClickableText: secondaryColor,
                            trimMode: TrimMode.Line,
                            trimCollapsedText: ' more',
                            trimExpandedText: ' less',
                            style: TextStyle(
                              color: txtColor.withOpacity(0.8),
                              fontSize: 15.sp,
                            ),
                            moreStyle: TextStyle(
                                fontSize: 16.sp, color: primaryColor, fontWeight: FontWeight.bold),
                            lessStyle: TextStyle(
                                fontSize: 16.sp, color: primaryColor, fontWeight: FontWeight.bold),
                          ),
                          Divider(),
                          SizedBox(height: 10.h),
                          Text(
                            'Select Size',
                            style: TextStyle(
                                color: txtColor, fontSize: 18.sp, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 10.h),
                          TabBar(
                            tabAlignment: TabAlignment.start,
                            isScrollable: true,
                            controller: tabController,
                            labelPadding: EdgeInsets.zero,
                            padding: EdgeInsets.zero,
                            labelColor: Colors.brown,
                            indicatorColor: Colors.transparent,
                            indicatorPadding: EdgeInsets.zero,
                            dividerColor: Colors.transparent,
                            overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
                            onTap: (value) {
                              print(value);
                              productDetailsController.sizeIndex.value = value;
                            },
                            tabs: List.generate(
                                productDetailsController.sizeList.length,
                                (index) => Obx(() => Container(
                                      margin: EdgeInsets.symmetric(horizontal: 5.w),
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8.r),
                                        color: productDetailsController.sizeIndex.value == index
                                            ? primaryColor
                                            : Colors.transparent,
                                        border: Border.all(
                                            color: productDetailsController.sizeIndex.value == index
                                                ? Colors.transparent
                                                : txtColor.withOpacity(0.2)),
                                      ),
                                      child: Text(
                                        productDetailsController.sizeList[index],
                                        style: TextStyle(
                                            color: productDetailsController.sizeIndex.value == index
                                                ? white
                                                : txtColor,
                                            fontSize: 14.sp),
                                      ),
                                    ))),
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            children: [
                              Text(
                                'Select Color: ',
                                style: TextStyle(
                                    color: txtColor, fontSize: 18.sp, fontWeight: FontWeight.w500),
                              ),
                              Text(
                                productDetailsController
                                    .colorList[productDetailsController.colorIndex.value]['name'],
                                style: TextStyle(
                                    color: txtColor.withOpacity(0.5),
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          TabBar(
                            tabAlignment: TabAlignment.start,
                            isScrollable: true,
                            controller: tabController1,
                            labelPadding: EdgeInsets.zero,
                            padding: EdgeInsets.zero,
                            labelColor: Colors.brown,
                            indicatorColor: Colors.transparent,
                            indicatorPadding: EdgeInsets.zero,
                            dividerColor: Colors.transparent,
                            overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
                            onTap: (value) {
                              print(value);
                              productDetailsController.colorIndex.value = value;
                            },
                            tabs: List.generate(
                                productDetailsController.colorList.length,
                                (index) => Obx(() => Container(
                                      margin: EdgeInsets.symmetric(horizontal: 5.w),
                                      padding: EdgeInsets.all(8.h),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: productDetailsController.colorList[index]['color'],
                                      ),
                                      child: Container(
                                        // height: 20.h,
                                        // width: 20.h,
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.all(8.h),
                                        decoration: BoxDecoration(
                                          color: productDetailsController.colorIndex.value == index
                                              ? white
                                              : productDetailsController.colorList[index]['color'],
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ))),
                          ),
                          SizedBox(height: 150.h),
                        ],
                      ),
                    )
                  ],
                )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                    color: white,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(3, -3),
                        color: secondaryColor.withOpacity(0.5),
                        blurRadius: 5,
                        spreadRadius: 2,
                      )
                    ],
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(25.r),
                    )),
                height: 85.h,
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total Price',
                          style: TextStyle(fontSize: 14.sp, color: txtColor),
                        ),
                        Text(
                          '\$${widget.data[widget.index]['price']}',
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.w700, color: txtColor),
                        )
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        print(cartController.cartList.toString());
                        if (!widget.data[widget.index]['inCart']) {
                          productDetailsController.addedToCart.value = true;
                          cartController.cartList.add({
                            'title': widget.data[widget.index]['title'],
                            'type': 0,
                            'image': widget.data[widget.index]['image'],
                            'price': widget.data[widget.index]['price'],
                            'rating': widget.data[widget.index]['rating'],
                            'isLiked': true,
                            'inCart': true
                          });
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 12.h),
                        decoration: BoxDecoration(
                            color: primaryColor, borderRadius: BorderRadius.circular(50.r)),
                        child: Obx(() => Row(
                              children: [
                                Image.asset(
                                  productDetailsController.addedToCart.value
                                      ? 'asset/navbar/bag1.png'
                                      : 'asset/navbar/bag.png',
                                  color: white,
                                  height: 28.h,
                                  width: 28.w,
                                ),
                                SizedBox(
                                  width: 15.w,
                                ),
                                Text(
                                  productDetailsController.addedToCart.value
                                      ? 'Added'
                                      : 'Add to Cart',
                                  style: TextStyle(fontSize: 18.sp, color: white),
                                ),
                              ],
                            )),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget myAppbar(onTap) {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      padding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 20.w),
      // padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
              height: 45.h,
              width: 45.w,
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(shape: BoxShape.circle, color: white, boxShadow: [
                BoxShadow(
                    color: grey.withOpacity(0.5),
                    spreadRadius: 1,
                    offset: Offset(1, 1),
                    blurRadius: 1)
              ]),
              child: Icon(
                Icons.arrow_back,
                color: primaryColor,
              ),
            ),
          ),
          // Text(
          //   'Product Details',
          //   style: TextStyle(color: txtColor, fontWeight: FontWeight.w400, fontSize: 18.sp),
          // ),
          Container(
            height: 45.h,
            width: 45.w,
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(shape: BoxShape.circle, color: white, boxShadow: [
              BoxShadow(
                  color: grey.withOpacity(0.5),
                  spreadRadius: 1,
                  offset: Offset(1, 1),
                  blurRadius: 1)
            ]),
            child: Image.asset(
              widget.data[widget.index]['isLiked']
                  ? 'asset/navbar/heart1.png'
                  : 'asset/navbar/heart.png',
              color: primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
