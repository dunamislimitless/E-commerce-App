import 'appicons.dart';

import 'colors.dart';

import 'textstyle.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class FinalCart extends StatelessWidget {
  const FinalCart(
      {super.key,
      required this.imagePath,
      required this.itemDescripton,
      required this.reviews,
      required this.amount,
      required this.initialValue});
  final String reviews;
  final String itemDescripton;
  final String imagePath;
  final String amount;
  final String initialValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 119.h,
      width: 386.w,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(6.r)),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(12.0.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemDescripton,
                  style: AppText.itemText,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 2.0.h, top: 8.0.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AppIcons.star,
                      Padding(
                        padding: EdgeInsets.only(left: 12.0.w),
                        child: Text(
                          reviews,
                          style: AppText.reviewText,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
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
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 25.r,
                height: 25.r,
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black, width: 0.5)),
                child: Center(
                    child: Icon(
                  Icons.add,
                  size: 18.r,
                )),
              ),
              Text(initialValue),
              Container(
                  width: 25.r,
                  height: 25.r,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black, width: 0.5)),
                  child: Center(
                      child: Icon(
                    Icons.remove,
                    size: 18.r,
                  ))),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 5.h, left: 5.w, right: 5.w),
            child: SizedBox(
                height: 95.h, width: 84.w, child: Image.asset(imagePath)),
          ),
        ],
      ),
    );
  }
}
