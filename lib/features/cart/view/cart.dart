import 'package:e_commerce_app/app/utils/app_ipngs.dart';
import 'package:e_commerce_app/app/utils/appicons.dart';
import 'package:e_commerce_app/app/utils/appstrings.dart';

import 'package:e_commerce_app/app/utils/colors.dart';
import 'package:e_commerce_app/features/cart/cart_bloc/cart_bloc.dart';
import 'package:e_commerce_app/features/cart/cart_bloc/cart_event.dart';
import 'package:e_commerce_app/features/cart/cart_bloc/cart_state.dart';
import 'package:e_commerce_app/features/dashboard/views/home.dart';
import 'package:e_commerce_app/features/dashboard/widget/custom_button.dart';
import 'package:e_commerce_app/features/cart/widget/custom_row.dart';

import 'package:e_commerce_app/app/extensions/extension.dart';

import 'package:e_commerce_app/features/cart/models/final_cart_model.dart';

import 'package:e_commerce_app/features/dashboard/widget/page_header.dart';

import 'package:e_commerce_app/app/utils/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Cart extends StatelessWidget {
  Cart({super.key});
  List<FinalCart> product = [
    FinalCart(
      imagePath: AppImage.headset,
      itemDescripton: 'Wireless Headphone',
      reviews: "(379)",
      amount: '\$65',
      initialValue: '2',
    ),
    FinalCart(
      imagePath: AppImage.sneakers,
      itemDescripton: 'Bluetooth Speaker',
      reviews: "(249)",
      amount: '\$40',
      initialValue: '1',
    ),
    FinalCart(
      imagePath: AppImage.flower,
      itemDescripton: 'Smart Watch',
      reviews: "(589)",
      amount: '\$120',
      initialValue: '0',
    ),
    FinalCart(
      imagePath: AppImage.flower,
      itemDescripton: 'Smart Watch',
      reviews: "(589)",
      amount: '\$120',
      initialValue: '0',
    ),
    FinalCart(
      imagePath: AppImage.flower,
      itemDescripton: 'Smart Watch',
      reviews: "(589)",
      amount: '\$120',
      initialValue: '0',
    ),
    FinalCart(
      imagePath: AppImage.flower,
      itemDescripton: 'Smart Watch',
      reviews: "(589)",
      amount: '\$120',
      initialValue: '0',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CombinedBloc(product),
        child: Scaffold(
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
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Home()));
                    })),
                SizedBox(
                  height: 30.h,
                ),
                Expanded(child: BlocBuilder<CombinedBloc, CombinedState>(
                    builder: (context, state) {
                  if (state.cartItems.isEmpty) {
                    return const Center(child: Text('Your cart is empty.'));
                  }
                  return ListView.builder(
                    itemCount: product.length,
                    itemBuilder: (context, index) {
                      final each = product[index];
                      return Dismissible(
                        key: UniqueKey(),
                        direction: DismissDirection.endToStart,
                        onDismissed: (direction) {
                          BlocProvider.of<CombinedBloc>(context)
                              .add(RemoveCartItemEvent(index));
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content:
                                    Text("${each.itemDescripton} removed")),
                          );
                        },
                        background: Container(
                          color: AppColors.backgroundColor,
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(Icons.delete_outline_outlined,
                                  color: AppColors.favoriteColor),
                              SizedBox(
                                height: 15.h,
                              ),
                              const Text(
                                AppString.remove,
                                style:
                                    TextStyle(color: AppColors.favoriteColor),
                              )
                            ],
                          ),
                        ),
                        child: Padding(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        each.itemDescripton,
                                        style: AppText.itemText,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            bottom: 2.0.h, top: 8.0.h),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            AppIcons.star,
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 12.0.w),
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
                                    ).onTap(() {
                                      BlocProvider.of<CombinedBloc>(context)
                                          .add(IncrementEvent(index));
                                    }),
                                    BlocBuilder<CombinedBloc, CombinedState>(
                                      builder: (context, state) {
                                        return Text(state
                                            .cartItems[index].initialValue
                                            .toString());
                                      },
                                    ),
                                    Container(
                                        width: 25.r,
                                        height: 25.r,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: Colors.black,
                                                width: 0.5)),
                                        child: Center(
                                            child: Icon(
                                          Icons.remove,
                                          size: 18.r,
                                        ))).onTap(() {
                                      BlocProvider.of<CombinedBloc>(context)
                                          .add(DecrementEvent(index));
                                    })
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
                        ),
                      );
                    },
                  );
                })),
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
                        CustomRow(
                            options: 'Disccount (%20)', object: '\$117.80'),
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
        ));
  }
}
