import 'package:e_commerce_app/utils/widgets/bottom_button.dart';
import 'package:e_commerce_app/app/features/cart/view/cart.dart';
import 'package:e_commerce_app/app/features/cart/view/cart_category.dart';
import 'package:e_commerce_app/app/features/dashboard/views/home.dart';
import 'package:e_commerce_app/app/features/product/view/product_detail.dart';
import 'package:e_commerce_app/utils/widgets/colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme:
                ColorScheme.fromSeed(seedColor: AppColors.discountColor),
            useMaterial3: true,
          ),
          home: const BottomNavScreen()),
    );
  }
}
