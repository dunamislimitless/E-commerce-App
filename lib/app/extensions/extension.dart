import 'package:flutter/material.dart';

extension WidgetHelper on Widget {
  Widget onTap(VoidCallback? onTap) => GestureDetector(
        onTap: onTap,
        child: this,
      );

  Widget padding(
      {double left = 0, double right = 0, double top = 0, double bottom = 0}) {
    return Padding(
        padding:
            EdgeInsets.only(bottom: bottom, top: top, left: left, right: right),
        child: this);
  }

  Widget paddingAll(double value) {
    return Padding(padding: EdgeInsets.all(value), child: this);
  }

  Widget paddingSymmetric({double vertical = 0, double horizontal = 0}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
      child: this,
    );
  }
}

extension StringHelper on String {
  String capitalizeFirstLetter() {
    if (this.isEmpty) {
      return this;
    }
    return this[0].toUpperCase() + substring(1);
  }

  bool isValidEmail() => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(this);

  bool isValidatePassword() => RegExp(r'^[a-zA-Z0-9]{8,}$').hasMatch(this);

  String sanitize() {
    final regex = RegExp(r'^[^a-zA-Z]+');
    return this.replaceFirst(regex, '');
  }

  String shorten(int maxLength) {
    if (this.length <= maxLength) return this;
    return '${this.substring(0, maxLength)}...';
  }
}
