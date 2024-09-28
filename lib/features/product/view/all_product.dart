import 'package:e_commerce_app/app/extensions/extension.dart';
import 'package:e_commerce_app/app/utils/app_ipngs.dart';
import 'package:e_commerce_app/app/utils/appicons.dart';
import 'package:e_commerce_app/app/utils/appstrings.dart';
import 'package:e_commerce_app/app/utils/colors.dart';
import 'package:e_commerce_app/app/utils/textstyle.dart';
import 'package:e_commerce_app/features/cart/cart_bloc/cart_bloc.dart';
import 'package:e_commerce_app/features/cart/cart_bloc/cart_event.dart';
import 'package:e_commerce_app/features/cart/models/final_cart_model.dart';
import 'package:e_commerce_app/features/dashboard/widget/page_header.dart';
import 'package:e_commerce_app/features/product/view/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCatalog extends StatelessWidget {
  ProductCatalog({super.key, this.moveToCart});

  final VoidCallback? moveToCart;

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
                title: AppString.products,
                trailing: AppIcons.cartLoaded.onTap(() {
                  Navigator.pop(context, 2);
                }),
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
                padding: EdgeInsets.zero,
                shrinkWrap: true,
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
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '\$${each.amount}',
                                  style: AppText.amountText,
                                ),
                                Text(AppString.view, style: AppText.view)
                                    .onTap(() {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ProductDetail(
                                                amount: each.amount,
                                                imagePath: each.imagePath,
                                                descrition: each.itemDescripton,
                                                productName:
                                                    each.itemDescripton,
                                                eachProduct: each,
                                              )));
                                })
                              ]),
                        ],
                      ),
                    ),
                  ).onTap(() {
                    context.read<CartBloc>().add(AddItemEvent(item: each));
                    if (moveToCart != null) moveToCart!();
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

// final products = [
//   const CartItem(
//       imagePath: AppImage.bag,
//       itemDescripton: AppString.bag,
//       reviews: '(715 ${AppString.review})',
//       amount: '\$135.00'),
//   const CartItem(
//       imagePath: AppImage.headset,
//       itemDescripton: AppString.bag,
//       reviews: '(379 ${AppString.review})',
//       amount: '\$65.00'),
//   const CartItem(
//       imagePath: AppImage.cap,
//       itemDescripton: AppString.cap,
//       reviews: '(36 ${AppString.review})',
//       amount: '\$271.00'),
//   const CartItem(
//       imagePath: AppImage.flower,
//       itemDescripton: AppString.flower,
//       reviews: '(2184 ${AppString.review})',
//       amount: '\$248.00'),
//   const CartItem(
//       imagePath: AppImage.brownBag,
//       itemDescripton: AppString.leatherBag,
//       reviews: '(328 ${AppString.review})',
//       amount: '\$374.00'),
//   const CartItem(
//       imagePath: AppImage.desk,
//       itemDescripton: AppString.deskClock,
//       reviews: '(3721 ${AppString.review})',
//       amount: '\$125..00'),
//   const CartItem(
//       imagePath: AppImage.watch,
//       itemDescripton: AppString.swissWatch,
//       reviews: '(715 ${AppString.review})',
//       amount: '\$27.50'),
//   const CartItem(
//       imagePath: AppImage.sneakers,
//       itemDescripton: AppString.sneakers,
//       reviews: '(379 ${AppString.review})',
//       amount: '\$78.90'),
// ];
}

final cart = [
  FinalCart(
    id: "id1",
    imagePath: AppImage.headset,
    itemDescripton: 'Wireless Headphone',
    reviews: "(379)",
    amount: 65,
    itemCount: 2,
  ),
  FinalCart(
    id: "id2",
    imagePath: AppImage.sneakers,
    itemDescripton: 'Bluetooth Speaker',
    reviews: "(249)",
    amount: 40,
    itemCount: 1,
  ),
  FinalCart(
    id: "id3",
    imagePath: AppImage.flower,
    itemDescripton: 'Smart Watch',
    reviews: "(589)",
    amount: 120,
    itemCount: 4,
  ),
  FinalCart(
    id: "id4",
    imagePath: AppImage.bag,
    itemDescripton: AppString.bag,
    reviews: "(719)",
    amount: 120,
    itemCount: 4,
  ),
  FinalCart(
    id: "id5",
    imagePath: AppImage.brownBag,
    itemDescripton: AppString.leatherBag,
    reviews: "(899)",
    amount: 170,
    itemCount: 3,
  ),
  FinalCart(
    id: "id6",
    imagePath: AppImage.desk,
    itemDescripton: 'Smart Watch',
    reviews: "(589)",
    amount: 120,
    itemCount: 2,
  ),
  FinalCart(
    id: "id7",
    imagePath: AppImage.desk,
    itemDescripton: AppString.deskClock,
    reviews: "(4489)",
    amount: 120,
    itemCount: 3,
  ),
  FinalCart(
    id: "id8",
    imagePath: AppImage.watch,
    itemDescripton: AppString.swissWatch,
    reviews: "(589)",
    amount: 120,
    itemCount: 2,
  ),
];
