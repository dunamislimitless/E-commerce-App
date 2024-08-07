import 'package:e_commerce_app/widgets/colors.dart';
import 'package:e_commerce_app/widgets/textstyle.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OptionsContainer extends StatelessWidget {
  const OptionsContainer({
    super.key,
    required this.data,
  });

  final String data;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: IntrinsicHeight(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.discountColor,
              borderRadius: BorderRadius.circular(6.sp),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                  left: 12.w, right: 12.w, top: 6.h, bottom: 6.h),
              child: Text(
                data,
                style: AppText.buttonText,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
