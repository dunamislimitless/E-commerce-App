import 'package:e_commerce_app/app/utils/appstrings.dart';
import 'package:e_commerce_app/features/product/view/all_product.dart';
import 'package:e_commerce_app/features/cart/view/cart_category.dart';
import 'package:e_commerce_app/app/utils/appicons.dart';
import 'package:e_commerce_app/features/product/models/product_cart_model.dart';
import 'package:e_commerce_app/app/utils/colors.dart';
import 'package:e_commerce_app/features/dashboard/widget/discount_container.dart';
import 'package:e_commerce_app/app/extensions/extension.dart';
import 'package:e_commerce_app/app/widgets/latest_cart.dart';
import 'package:e_commerce_app/features/dashboard/models/options_model.dart';
import 'package:e_commerce_app/features/dashboard/widget/page_header.dart';
import 'package:e_commerce_app/app/utils/textstyle.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: SingleChildScrollView(
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
                discountPercent: '30%',
                item: 'home decoration products',
                imagepath: 'assets/images/home_page_picture.png',
              ),
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
                  ).onTap(() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CartCategory()));
                  })
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 34.h,
                      child: ListView.builder(
                        itemCount: options.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: ((context, index) {
                          final each = options[index];

                          return IntrinsicWidth(
                            child: IntrinsicHeight(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.w),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.discountColor,
                                    borderRadius: BorderRadius.circular(6.sp),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 12.w,
                                        right: 12.w,
                                        top: 6.h,
                                        bottom: 6.h),
                                    child: Text(
                                      each.data,
                                      style: AppText.buttonText,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppString.popularProduct,
                    style: AppText.titleText,
                  ),
                  Text(
                    AppString.seeAll,
                    style: AppText.seeAll,
                  ).onTap(() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => ProductCatalog())));
                  })
                ],
              ),
              SizedBox(
                height: 300.h,
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.w,
                    mainAxisSpacing: 8.h,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: cart.length,
                  itemBuilder: (context, index) {
                    final each = cart[index];
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
      ),
    );
  }
}

final List options = [
  OptionsContainer(data: AppString.all),
  OptionsContainer(data: AppString.elctronic),
  OptionsContainer(data: AppString.fashion),
  OptionsContainer(data: AppString.shoes),
  OptionsContainer(data: AppString.furniture),
];
final List cart = [
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
];
