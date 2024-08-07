import 'package:e_commerce_app/widgets/appicons.dart';

import 'package:e_commerce_app/widgets/colors.dart';

import 'package:e_commerce_app/widgets/textstyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItem extends StatelessWidget {
  const CartItem(
      {super.key,
      required this.imagePath,
      required this.itemDescripton,
      required this.reviews,
      required this.amount});
  final String reviews;
  final String itemDescripton;
  final String imagePath;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: 268.h,
        width: 180.w,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(6.sp)),
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
                child: Image.asset(imagePath),
              ),
              Text(
                itemDescripton,
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
                        reviews,
                        style: AppText.reviewText,
                      ),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  amount,
                  style: AppText.amountText,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
