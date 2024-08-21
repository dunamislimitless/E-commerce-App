import 'package:e_commerce_app/app/utils/appicons.dart';
import 'package:e_commerce_app/app/utils/appstrings.dart';
import 'package:e_commerce_app/app/utils/colors.dart';
import 'package:e_commerce_app/app/widgets/custom_button.dart';
import 'package:e_commerce_app/app/extensions/extension.dart';
import 'package:e_commerce_app/features/dashboard/widget/page_header.dart';
import 'package:e_commerce_app/app/widgets/rating_bar.dart';
import 'package:e_commerce_app/app/utils/textstyle.dart';
import 'package:e_commerce_app/app/widgets/user_colour_specification.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

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
                    Navigator.pop(context);
                  })),
              SizedBox(
                height: 30.h,
              ),
              Image.asset('assets/images/wristwatch.png'),
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
                        AppString.smartWatch,
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
                        '\$345.00',
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
                AppString.productDescription,
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
