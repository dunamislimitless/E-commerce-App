import 'package:e_commerce_app/app/utils/appstrings.dart';
import 'package:flutter/widgets.dart';

import '../../../app/utils/colors.dart';
import 'custom_button.dart';
import '../../../app/utils/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DiscountContaieer extends StatelessWidget {
  const DiscountContaieer(
      {super.key,
      required this.discountPercent,
      required this.item,
      required this.imagepath});
  final String discountPercent;
  final String item;
  final String imagepath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.h,
      width: 386.w,
      decoration: BoxDecoration(
          color: AppColors.discountColor,
          borderRadius: BorderRadius.circular(6.sp)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(imagepath),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Text("$discountPercent ${AppString.discount} $item",
                      style: AppText.discountText),
                  SizedBox(
                    height: 18.h,
                  ),
                  CustomButton(
                    onPressed: () {},
                    buttontext: AppString.getNow,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
