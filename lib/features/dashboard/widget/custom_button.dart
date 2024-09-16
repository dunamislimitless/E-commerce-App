import '../../../app/utils/colors.dart';
import '../../../app/utils/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key,
      this.buttontext,
      required this.onPressed,
      this.child,
      this.buttonWidth,
      this.height,
      this.textColor,
      this.color});
  dynamic buttontext;
  final VoidCallback? onPressed;
  double? buttonWidth;
  Widget? child;
  double? height;
  Color? color;
  Color? textColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 36.h,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            backgroundColor:
                WidgetStateProperty.all(color ?? AppColors.lightButton),
            padding: WidgetStateProperty.all(
                EdgeInsets.only(left: 8.w, right: 8.w))),
        child: child ??
            Text(
              buttontext,
              style: AppText.buttonText,
            ),
      ),
    );
  }
}
