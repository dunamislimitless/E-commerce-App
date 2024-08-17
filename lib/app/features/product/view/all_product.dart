import 'package:e_commerce_app/utils/widgets/appicons.dart';
import 'package:e_commerce_app/utils/widgets/appstrings.dart';
import 'package:e_commerce_app/app/features/product/models/product_cart_model.dart';
import 'package:e_commerce_app/utils/widgets/colors.dart';
import 'package:e_commerce_app/utils/widgets/discount_container.dart';
import 'package:e_commerce_app/utils/extensions/extension.dart';
import 'package:e_commerce_app/utils/widgets/latest_cart.dart';
import 'package:e_commerce_app/app/features/dashboard/models/options_model.dart';
import 'package:e_commerce_app/utils/widgets/page_header.dart';
import 'package:e_commerce_app/app/features/cart/models/product_container_model.dart';
import 'package:e_commerce_app/utils/widgets/textstyle.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCatalog extends StatelessWidget {
  ProductCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 50.h,
            ),
            PageHeader(
                title: AppString.popularProduct,
                trailing: AppIcons.cartLoaded.onTap(() {}),
                leading: AppIcons.arrowBack.onTap(() {
                  Navigator.pop(context);
                })),
            SizedBox(
              height: 30.h,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.w,
                  mainAxisSpacing: 8.h,
                  childAspectRatio: 0.7,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final each = products[index];
                  return Container(
                    height: 268.h,
                    width: 180.w,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6.r)),
                    child: Padding(
                      padding: EdgeInsets.all(8.0.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 12.h),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: AppIcons.favoriteGray,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 12.h),
                            child: Image.asset(each.imagePath),
                          ),
                          Text(
                            each.itemDescripton,
                            style: AppText.itemText,
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 2.0.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                AppIcons.star,
                                Padding(
                                  padding: EdgeInsets.only(left: 8.0.w),
                                  child: Text(
                                    each.reviews,
                                    style: AppText.reviewText,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              each.amount,
                              style: AppText.amountText,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<CartItem> products = [
    const CartItem(
        imagePath: 'assets/images/bag.png',
        itemDescripton: AppString.bag,
        reviews: '(715 ${AppString.review})',
        amount: '\$135.00'),
    const CartItem(
        imagePath: 'assets/images/headset.png',
        itemDescripton: AppString.bag,
        reviews: '(379 ${AppString.review})',
        amount: '\$65.00'),
    const CartItem(
        imagePath: 'assets/images/cap.png',
        itemDescripton: AppString.cap,
        reviews: '(36 ${AppString.review})',
        amount: '\$271.00'),
    const CartItem(
        imagePath: 'assets/images/flower.png',
        itemDescripton: AppString.flower,
        reviews: '(2184 ${AppString.review})',
        amount: '\$248.00'),
    const CartItem(
        imagePath: 'assets/images/brownbag.png',
        itemDescripton: AppString.leatherBag,
        reviews: '(328 ${AppString.review})',
        amount: '\$374.00'),
    const CartItem(
        imagePath: 'assets/images/desk.png',
        itemDescripton: AppString.deskClock,
        reviews: '(3721 ${AppString.review})',
        amount: '\$125..00'),
    const CartItem(
        imagePath: 'assets/images/watch.png',
        itemDescripton: AppString.swissWatch,
        reviews: '(715 ${AppString.review})',
        amount: '\$27.50'),
    const CartItem(
        imagePath: 'assets/images/sneakers.png',
        itemDescripton: AppString.sneakers,
        reviews: '(379 ${AppString.review})',
        amount: '\$78.90'),
  ];
}
