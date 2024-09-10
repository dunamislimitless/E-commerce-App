import 'package:e_commerce_app/app/utils/app_ipngs.dart';
import 'package:e_commerce_app/app/utils/appicons.dart';
import 'package:e_commerce_app/app/utils/appstrings.dart';
import 'package:e_commerce_app/app/utils/colors.dart';
import 'package:e_commerce_app/features/dashboard/views/home.dart';
import 'package:e_commerce_app/features/dashboard/widget/custom_button.dart';
import 'package:e_commerce_app/app/extensions/extension.dart';
import 'package:e_commerce_app/features/dashboard/widget/page_header.dart';
import 'package:e_commerce_app/features/product/widget/rating_bar.dart';
import 'package:e_commerce_app/app/utils/textstyle.dart';
import 'package:e_commerce_app/features/product/widget/user_colour_specification.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail(
      {super.key,
      required this.amount,
      required this.imagePath,
      required this.descrition,
      required this.productName});
  final String amount;
  final String imagePath;
  final String descrition;
  final String productName;

  @override
  Widget build(BuildContext context) {
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
                  trailing: AppIcons.favorite.onTap(() {}),
                  leading: AppIcons.arrowBack.onTap(() {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Home()),
                    );
                  })),
              SizedBox(
                height: 30.h,
              ),
              Image.asset(imagePath ?? AppImage.wristWatch),
              //AppImage.wristWatch,
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
                        productName ?? AppString.smartWatch,
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
                        amount ?? '\$345.00',
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
                descrition ?? AppString.productDescription,
                style: AppText.reviewText,
              ),
              SizedBox(
                height: 30.h,
              ),
              CustomButton(
                onPressed: () {},
                buttontext: AppString.add2cart,
                height: 48.h,
                color: AppColors.discountColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
