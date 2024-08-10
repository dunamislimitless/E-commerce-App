import 'appstrings.dart';
import 'colors.dart';
import 'custom_button.dart';
import 'textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductContainer extends StatelessWidget {
  const ProductContainer({super.key, required this.icon, required this.name});
  final Widget icon;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      width: 118.w,
      decoration: BoxDecoration(
          color: AppColors.cardColor,
          borderRadius: BorderRadius.circular(10.sp)),
      child: Padding(
        padding:
            EdgeInsets.only(top: 20.h, bottom: 20.w, left: 24.w, right: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 44.h,
              width: 44.w,
              decoration: BoxDecoration(
                  color: AppColors.backgroundColor,
                  borderRadius: BorderRadius.circular(10.sp)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.h, vertical: 6.w),
                child: icon,
              ),
            ),
            SizedBox(
              height: 22.h,
            ),
            Text(
              name,
              style: AppText.seeAll,
            )
          ],
        ),
      ),
    );
  }
}
