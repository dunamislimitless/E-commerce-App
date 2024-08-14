import 'package:e_commerce_app/utils/widgets/appicons.dart';
import 'package:e_commerce_app/utils/widgets/appstrings.dart';
import 'package:e_commerce_app/utils/widgets/cart.container.dart';
import 'package:e_commerce_app/utils/widgets/colors.dart';
import 'package:e_commerce_app/utils/widgets/custom_button.dart';
import 'package:e_commerce_app/utils/widgets/custom_row.dart';
import 'package:e_commerce_app/utils/widgets/discount_container.dart';
import 'package:e_commerce_app/utils/widgets/extensions/extension.dart';
import 'package:e_commerce_app/utils/widgets/final_cart.dart';
import 'package:e_commerce_app/utils/widgets/latest_cart.dart';
import 'package:e_commerce_app/utils/widgets/options_container.dart';
import 'package:e_commerce_app/utils/widgets/page_header.dart';
import 'package:e_commerce_app/utils/widgets/product_container.dart';
import 'package:e_commerce_app/utils/widgets/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

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
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    child: FinalCart(
                      imagePath: product.imagePath,
                      itemDescripton: product.itemDescripton,
                      reviews: product.reviews,
                      amount: product.amount,
                      initialValue: product.initialValue,
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

  List<FinalCart> getProduct() {
    return [
      const FinalCart(
        imagePath: 'assets/images/headset.png',
        itemDescripton: 'Wireless Headphone',
        reviews: "(379)",
        amount: '\$65',
        initialValue: '2',
      ),
      const FinalCart(
        imagePath: 'assets/images/sneakers.png',
        itemDescripton: 'Bluetooth Speaker',
        reviews: "(249)",
        amount: '\$40',
        initialValue: '1',
      ),
      const FinalCart(
        imagePath: 'assets/images/flower.png',
        itemDescripton: 'Smart Watch',
        reviews: "(589)",
        amount: '\$120',
        initialValue: '0',
      ),
    ];
  }
}
