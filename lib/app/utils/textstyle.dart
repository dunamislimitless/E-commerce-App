import 'colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppText {
  static TextStyle titleText = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    fontFamily: 'Inter',
  );

  static TextStyle smallBoldText = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
    fontSize: 10.sp,
  );

  static TextStyle itallicText = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
    fontSize: 10.sp,
    fontStyle: FontStyle.italic,
  );

  static TextStyle itemText = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    fontFamily: 'Inter',
  );
  static TextStyle regular400 = TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      fontFamily: 'Inter',
      color: AppColors.reviewColor);
  static TextStyle reviewText = TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      fontFamily: 'Inter',
      color: AppColors.reviewColor);

  static TextStyle buttonText = TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.bold,
      fontFamily: 'Inter',
      color: Colors.white);

  static TextStyle seeAll = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    fontFamily: 'Inter',
  );

  static TextStyle discountText = TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.w500,
      fontFamily: 'Inter',
      color: Colors.white);
  static TextStyle cartText = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
    fontFamily: 'Inter',
  );
  static TextStyle amountText = TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.w500,
      fontFamily: 'Inter',
      color: AppColors.discountColor);

  static TextStyle view = TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      fontFamily: 'Inter',
      color: AppColors.discountColor);

  static TextStyle cartAmount = TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.w500,
      fontFamily: 'Inter',
      color: AppColors.discountColor);
  static TextStyle productName = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w500,
    fontFamily: 'Inter',
  );
}
