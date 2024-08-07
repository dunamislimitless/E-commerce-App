import 'package:e_commerce_app/widgets/colors.dart';
import 'package:e_commerce_app/widgets/textstyle.dart';
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
      width: buttonWidth ?? 268.w,
      height: height ?? 36,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(color ?? AppColors.lightButton),
            padding: MaterialStateProperty.all(
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
