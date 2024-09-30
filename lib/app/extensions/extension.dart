import 'package:flutter/material.dart';

extension WidgetHelper on Widget {
  Widget onTap(VoidCallback? onTap) => GestureDetector(
        onTap: onTap,
        child: this,
      );
}
 extension StringHelper on String {

  String capitalizeFirstLetter() {
    if (this.isEmpty) {
      return this;
    }
    return this[0].toUpperCase() + substring(1);
  }
}
 