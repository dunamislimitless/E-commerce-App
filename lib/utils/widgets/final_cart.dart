import 'appicons.dart';

import 'colors.dart';

import 'textstyle.dart';
import 'package:flutter/material.dart';

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
      padding: EdgeInsets.all(5.0.w),
      child: Container(
        height: 119.h,
        width: 386.w,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(6.r)),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 
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
             Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: Image.asset(imagePath),
            ),
          ],
        ),
      ),
    );
  }
}
