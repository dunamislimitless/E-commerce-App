import 'package:e_commerce_app/widgets/appstrings.dart';
import 'package:e_commerce_app/widgets/colors.dart';
import 'package:e_commerce_app/widgets/custom_button.dart';
import 'package:e_commerce_app/widgets/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DiscountContaieer extends StatelessWidget {
  const DiscountContaieer(
      {super.key, required this.discountPercent, required this.item});
  final String discountPercent;
  final String item;

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
            Image.asset('assets/images/home_page_picture.png'),
            SizedBox(width: 16.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("$discountPercent ${AppString.discount} $item",
                    style: AppText.discountText),
                SizedBox(
                  height: 18.h,
                ),
                CustomButton(onPressed: () {}, buttontext: AppString.getNow)
              ],
            )
          ],
        ),
      ),
    );
  }
}
