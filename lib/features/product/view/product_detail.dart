import 'package:e_commerce_app/app/extensions/extension.dart';
import 'package:e_commerce_app/app/utils/appicons.dart';
import 'package:e_commerce_app/app/utils/appstrings.dart';
import 'package:e_commerce_app/app/utils/colors.dart';
import 'package:e_commerce_app/app/utils/textstyle.dart';
import 'package:e_commerce_app/features/cart/cart_bloc/cart_bloc.dart';
import 'package:e_commerce_app/features/cart/cart_bloc/cart_event.dart';
import 'package:e_commerce_app/features/cart/models/final_cart_model.dart';
import 'package:e_commerce_app/features/cart/view/cart.dart';
import 'package:e_commerce_app/features/dashboard/views/home.dart';
import 'package:e_commerce_app/features/dashboard/widget/custom_button.dart';
import 'package:e_commerce_app/features/dashboard/widget/page_header.dart';
import 'package:e_commerce_app/features/product/widget/rating_bar.dart';
import 'package:e_commerce_app/features/product/widget/user_colour_specification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({
    super.key,
    required this.amount,
    required this.imagePath,
    required this.eachProduct,
    required this.descrition,
    required this.productName,
    this.moveToCart,
  });

  final num amount;
  final String imagePath;
  final String descrition;
  final FinalCart eachProduct;
  final String productName;
  final VoidCallback? moveToCart;

  @override
  Widget build(BuildContext context) {
    final bool isProductSelected = imagePath.isNotEmpty;

    return Scaffold(
      backgroundColor: AppColors.cardColor,
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
                title: AppString.popularDetail,
                trailing: SvgPicture.asset(AppIcons.favorite).onTap(() {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Cart()),
                  );
                }),
                leading: AppIcons.arrowBack.onTap(() {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const DashboardScreen()),
                  );
                }),
              ),
              SizedBox(
                height: 30.h,
              ),
              isProductSelected
                  ? Image.asset(imagePath)
                  : Text(
                      "Choose a product to view",
                      style: AppText.productName,
                    ),
              if (isProductSelected) ...[
                SizedBox(
                  height: 55.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          productName.isNotEmpty
                              ? productName
                              : AppString.smartWatch,
                          style: AppText.productName,
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Text(
                          AppString.unisex,
                          style: AppText.regular400,
                        ),
                        SizedBox(
                          height: 11.h,
                        ),
                        const RatingIndicator(),
                        SizedBox(
                          height: 30.h,
                        ),
                        Text(
                          AppString.color,
                          style: AppText.titleText,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        const ColorSelectorPage(),
                        SizedBox(
                          height: 34.h,
                        ),
                        Text(
                          AppString.about,
                          style: AppText.titleText,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(height: 10.h),
                        Text(
                          productName.isNotEmpty ? '\$${amount}' : '',
                          style: AppText.amountText,
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 14.h,
                ),
                Text(
                  descrition.isNotEmpty
                      ? descrition
                      : AppString.productDescription,
                  style: AppText.reviewText,
                ),
                SizedBox(
                  height: 30.h,
                ),
                CustomButton(
                  onPressed: () {
                    context
                        .read<CartBloc>()
                        .add(AddItemEvent(item: eachProduct));

                    if (moveToCart != null) moveToCart!();
                  },
                  buttontext: AppString.add2cart,
                  height: 48.h,
                  color: AppColors.discountColor,
                ),
              ] else ...[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 30.h),
                  child: Text(
                    "Product details are inactive. Please select a product.",
                    style: AppText.reviewText.copyWith(color: Colors.grey),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
