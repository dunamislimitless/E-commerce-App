import 'appicons.dart';
import 'textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LatestCart extends StatelessWidget {
  const LatestCart({
    super.key,
    required this.imagePath,
    required this.itemDescription,
    required this.reviews,
    required this.amount,
  });

  final String reviews;
  final String itemDescription;
  final String imagePath;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(5.0.w),
      child: Container(
        height: 98.h,
        width: 386.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(imagePath),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            itemDescription,
                            style: AppText.titleText,
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(left: 8.w),
                          child: Text(
                            reviews,
                            style: AppText.reviewText,
                          ),
                        ),
                        AppIcons.star,
                      ],
                    ),
                    Text(
                      amount,
                      style: AppText.amountText,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
