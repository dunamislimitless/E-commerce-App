import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app/utils/textstyle.dart';

class PageHeader extends StatelessWidget {
  const PageHeader(
      {super.key, required this.title, required this.trailing, this.leading});

  final String title;
  final Widget trailing;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (leading != null)
          leading!
        else
          SizedBox(
            width: 20.w,
          ),
        Text(
          title,
          style: AppText.titleText,
        ),
        trailing
      ],
    );
  }
}
