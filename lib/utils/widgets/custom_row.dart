import 'package:e_commerce_app/utils/widgets/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRow extends StatelessWidget {
  CustomRow(
      {super.key, required this.options, required this.object, this.textStyle});
  final String options;
  final String object;
  dynamic textStyle;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          options,
          style: AppText.reviewText,
        ),
        const Spacer(),
        Text(
          object,
          style: textStyle ?? AppText.cartText,
        ),
      ],
    );
  }
}
