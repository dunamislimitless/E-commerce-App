import 'package:e_commerce_app/common/bloc/button/button_state.dart';
import 'package:e_commerce_app/common/bloc/button/button_state_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/utils/colors.dart';
import '../../../app/utils/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        child: BlocBuilder<ButtonStateCubit, ButtonStateC>(
          builder: (context, state) {
            if (state is ButtonLoadingState) {
              return loading(context);
            }
            return initial(context);
          },
        ));
  }

  Widget loading(BuildContext context) {
    return ElevatedButton(
        onPressed: null,
        style: ButtonStyle(
            backgroundColor:
                WidgetStateProperty.all(color ?? AppColors.lightButton),
            padding: WidgetStateProperty.all(
                EdgeInsets.only(left: 8.w, right: 8.w))),
        child: CircularProgressIndicator());
  }

  Widget initial(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          backgroundColor:
              WidgetStateProperty.all(color ?? AppColors.lightButton),
          padding:
              WidgetStateProperty.all(EdgeInsets.only(left: 8.w, right: 8.w))),
      child: child ??
          Text(
            buttontext,
            style: AppText.buttonText,
          ),
    );
  }
}
