import 'package:flutter/material.dart';

extension WidgetHelper on Widget {
  Widget onTap(VoidCallback? onTap) => GestureDetector(
        onTap: onTap,
        child: this,
      );
}
