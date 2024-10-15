
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomLabeledInput extends StatelessWidget {
  final String label;
  final String title;
  final IconData prefixIcon;
  final bool obscureText;
  final TextEditingController controller;
  TextInputType? keyboardType;

  CustomLabeledInput({
    super.key,
    required this.label,
    required this.title,
    this.keyboardType,
    required this.prefixIcon,
    this.obscureText = false,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
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
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0.r),
            border: Border.all(
              color: Colors.black,
              width: 1.0.r,
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
            keyboardType: keyboardType,
          ),
        ),
        SizedBox(height: 24.0.h),
      ],
    );
  }
}
