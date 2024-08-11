import 'package:e_commerce_app/utils/widgets/appicons.dart';
import 'package:e_commerce_app/utils/widgets/appstrings.dart';
import 'package:e_commerce_app/utils/widgets/cart.container.dart';
import 'package:e_commerce_app/utils/widgets/colors.dart';
import 'package:e_commerce_app/utils/widgets/discount_container.dart';
import 'package:e_commerce_app/utils/widgets/extensions/extension.dart';
import 'package:e_commerce_app/utils/widgets/latest_cart.dart';
import 'package:e_commerce_app/utils/widgets/options_container.dart';
import 'package:e_commerce_app/utils/widgets/page_header.dart';
import 'package:e_commerce_app/utils/widgets/product_container.dart';
import 'package:e_commerce_app/utils/widgets/textstyle.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCatalog extends StatelessWidget {
  const ProductCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    final products = getProduct();
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
                  return products[index];
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<CartItem> getProduct() {
    return [
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
}
