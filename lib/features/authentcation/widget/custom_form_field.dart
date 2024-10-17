
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFormField extends StatelessWidget {
  final String label;
  final String title;
  IconData? prefixIcon;
  final bool obscureText;
  final TextEditingController? controller;
  dynamic svgIcon;

  CustomFormField({
    super.key,
    required this.label,
    required this.title,
    this.prefixIcon,
    this.obscureText = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 8.0.h),
        Container(
          width: size.width * 0.9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0.r),
            border: Border.all(
              color: Colors.black,
              width: 1.0.w,
            ),
          ),
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              labelText: label,
              prefixIcon: Icon(prefixIcon, color: Colors.black),
              border: InputBorder.none,
            ),
            obscureText: obscureText,
          ),
        ),
        SizedBox(height: 16.0.h),
      ],
    );
  }
}
