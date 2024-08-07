import 'package:e_commerce_app/extensions/extension.dart';
import 'package:e_commerce_app/widgets/appicons.dart';
import 'package:e_commerce_app/widgets/appstrings.dart';
import 'package:e_commerce_app/widgets/cart.container.dart';
import 'package:e_commerce_app/widgets/colors.dart';
import 'package:e_commerce_app/widgets/discount_container.dart';
import 'package:e_commerce_app/widgets/latest_cart.dart';
import 'package:e_commerce_app/widgets/options_container.dart';
import 'package:e_commerce_app/widgets/page_header.dart';
import 'package:e_commerce_app/widgets/textstyle.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 50.h,
            ),
            PageHeader(
                title: AppString.home,
                trailing: AppIcons.search.onTap(() {}),
                leading: AppIcons.menu.onTap(() {})),
            SizedBox(
              height: 20.h,
            ),
            const DiscountContaieer(
                discountPercent: '30%', item: 'home\ndecoration products'),
            SizedBox(
              height: 16.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppString.category,
                  style: AppText.titleText,
                ),
                Text(
                  AppString.seeAll,
                  style: AppText.seeAll,
                )
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  OptionsContainer(data: AppString.all),
                  OptionsContainer(data: AppString.elctronic),
                  OptionsContainer(data: AppString.fashion),
                  OptionsContainer(data: AppString.shoes),
                  OptionsContainer(data: AppString.furniture)
                ],
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppString.pp,
                  style: AppText.titleText,
                ),
                Text(
                  AppString.seeAll,
                  style: AppText.seeAll,
                )
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CartItem(
                    imagePath: 'assets/images/bag.png',
                    itemDescripton: AppString.bag,
                    reviews: '(715 ${AppString.review})',
                    amount: '\$135.00'),
                CartItem(
                    imagePath: 'assets/images/headset.png',
                    itemDescripton: AppString.bag,
                    reviews: '(379 ${AppString.review})',
                    amount: '\$65.00'),
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppString.lp,
                  style: AppText.titleText,
                ),
                Text(
                  AppString.seeAll,
                  style: AppText.seeAll,
                )
              ],
            ),
            SizedBox(height: 10.h),
            const LatestCart(
                imagePath: 'assets/images/headie.png',
                itemDescription: 'Headphone Holder',
                reviews: '(1446)',
                amount: '\$34.90')
          ],
        ),
      ),
    );
  }
}
