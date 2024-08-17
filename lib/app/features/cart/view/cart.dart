import 'package:e_commerce_app/utils/widgets/appicons.dart';
import 'package:e_commerce_app/utils/widgets/appstrings.dart';
import 'package:e_commerce_app/app/features/product/models/product_cart_model.dart';
import 'package:e_commerce_app/utils/widgets/colors.dart';
import 'package:e_commerce_app/utils/widgets/custom_button.dart';
import 'package:e_commerce_app/utils/widgets/custom_row.dart';
import 'package:e_commerce_app/utils/widgets/discount_container.dart';
import 'package:e_commerce_app/utils/extensions/extension.dart';

import 'package:e_commerce_app/app/features/cart/models/final_cart_model.dart';
import 'package:e_commerce_app/utils/widgets/latest_cart.dart';
import 'package:e_commerce_app/app/features/dashboard/models/options_model.dart';
import 'package:e_commerce_app/utils/widgets/page_header.dart';
import 'package:e_commerce_app/app/features/cart/models/product_container_model.dart';
import 'package:e_commerce_app/utils/widgets/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Cart extends StatelessWidget {
  Cart({super.key});

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
                title: AppString.cart,
                trailing: AppIcons.cartLoaded.onTap(() {}),
                leading: AppIcons.arrowBack.onTap(() {
                  Navigator.pop(context);
                })),
            SizedBox(
              height: 30.h,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: product.length,
                itemBuilder: (context, index) {
                  final each = product[index];
                  return Padding(
                    padding: EdgeInsets.only(bottom: 8.h),
                    child: Container(
                      height: 119.h,
                      width: 386.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6.r)),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(12.0.w),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  each.itemDescripton,
                                  style: AppText.itemText,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      bottom: 2.0.h, top: 8.0.h),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      AppIcons.star,
                                      Padding(
                                        padding: EdgeInsets.only(left: 12.0.w),
                                        child: Text(
                                          each.reviews,
                                          style: AppText.reviewText,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 12,
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
                          const Spacer(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 25.r,
                                height: 25.r,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Colors.black, width: 0.5)),
                                child: Center(
                                    child: Icon(
                                  Icons.add,
                                  size: 18.r,
                                )),
                              ),
                              Text(each.initialValue),
                              Container(
                                  width: 25.r,
                                  height: 25.r,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: Colors.black, width: 0.5)),
                                  child: Center(
                                      child: Icon(
                                    Icons.remove,
                                    size: 18.r,
                                  ))),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                bottom: 5.h, left: 5.w, right: 5.w),
                            child: SizedBox(
                                height: 95.h,
                                width: 84.w,
                                child: Image.asset(each.imagePath)),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Container(
              height: 192.h,
              width: 386.w,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    CustomRow(options: 'Select Item', object: '3'),
                    SizedBox(
                      height: 8.h,
                    ),
                    CustomRow(options: 'Subtotal', object: '\$589.00'),
                    SizedBox(
                      height: 8.h,
                    ),
                    CustomRow(options: 'Disccount (%20)', object: '\$117.80'),
                    SizedBox(
                      height: 8.h,
                    ),
                    const Divider(
                      thickness: 2,
                    ),
                    CustomRow(
                      options: 'Total',
                      object: '\$471.20',
                      textStyle: AppText.cartAmount,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            CustomButton(
              onPressed: () {},
              buttontext: 'ADD TO CART',
              height: 48.h,
              color: AppColors.discountColor,
            ),
            SizedBox(
              height: 60.h,
            )
          ],
        ),
      ),
    );
  }

  List<FinalCart> product = [
    FinalCart(
      imagePath: 'assets/images/headset.png',
      itemDescripton: 'Wireless Headphone',
      reviews: "(379)",
      amount: '\$65',
      initialValue: '2',
    ),
    FinalCart(
      imagePath: 'assets/images/sneakers.png',
      itemDescripton: 'Bluetooth Speaker',
      reviews: "(249)",
      amount: '\$40',
      initialValue: '1',
    ),
    FinalCart(
      imagePath: 'assets/images/flower.png',
      itemDescripton: 'Smart Watch',
      reviews: "(589)",
      amount: '\$120',
      initialValue: '0',
    ),
  ];
}
