import 'extensions/extension.dart';
import 'appicons.dart';
import 'textstyle.dart';
import 'package:flutter/material.dart';

class PageHeader extends StatelessWidget {
  const PageHeader(
      {super.key,
      required this.title,
      required this.trailing,
      required this.leading});
  final String title;
  final Widget trailing;
  final Widget leading;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        leading,
        Text(
          title,
          style: AppText.titleText,
        ),
        trailing
      ],
    );
  }
}
