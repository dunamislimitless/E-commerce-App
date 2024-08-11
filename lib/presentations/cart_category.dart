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

class CartCategory extends StatelessWidget {
  const CartCategory({super.key});

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
                title: AppString.category,
                trailing: AppIcons.search.onTap(() {}),
                leading: AppIcons.arrowBack.onTap(() {
                  Navigator.pop(context);
                })),
            SizedBox(
              height: 20.h,
            ),
            const DiscountContaieer(
              discountPercent: '15%',
              item: 'women shoes',
              imagepath: 'assets/images/shoe.png',
            ),
            SizedBox(
              height: 14.h,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8.w,
                  mainAxisSpacing: 8.h,
                  childAspectRatio: 1,
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

  List<ProductContainer> getProduct() {
    return [
      ProductContainer(icon: AppIcons.bag, name: AppString.bagg),
      ProductContainer(icon: AppIcons.wristwatch, name: AppString.watch),
      ProductContainer(icon: AppIcons.jewelry, name: AppString.jewelry),
      ProductContainer(icon: AppIcons.jewelry, name: AppString.jewelry),
      ProductContainer(icon: AppIcons.sport, name: AppString.sport),
      ProductContainer(icon: AppIcons.sport, name: AppString.sport),
      ProductContainer(icon: AppIcons.gift, name: AppString.gift),
      ProductContainer(icon: AppIcons.plant, name: AppString.plant),
      ProductContainer(icon: AppIcons.plant, name: AppString.plant),
      ProductContainer(icon: AppIcons.furniture, name: AppString.furniture),
      ProductContainer(icon: AppIcons.cosmetic, name: AppString.cosmetics),
      ProductContainer(icon: AppIcons.cosmetic, name: AppString.cosmetics),
    ];
  }
}
