import 'package:e_commerce_app/app/utils/app_ipngs.dart';
import 'package:e_commerce_app/app/utils/appstrings.dart';
import 'package:e_commerce_app/app/utils/colors.dart';
import 'package:e_commerce_app/features/dashboard/views/home.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class Payment extends StatelessWidget {
  const Payment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppString.paymentSuccesf,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: AppColors.lightButton,
      ),
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppImage.suceesIcon),
              // Lottie.asset(
              //   AppImage.suceesIcon,
              //   width: 150.w,
              //   height: 150.h,
              //   repeat: true,
              // ),
              SizedBox(height: 20.h),

              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.r),
                ),
                elevation: 8,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(20.w),
                  child: Column(
                    children: [
                      Icon(Icons.check_circle, color: Colors.green, size: 60.w),
                      SizedBox(height: 10.h),
                      Text(
                        AppString.paymentSuccesf,
                        style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[700],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        AppString.successMsg,
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.grey[700],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 30.h),

              // Return Home Button
              ElevatedButton.icon(
                onPressed: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DashboardScreen())),
                icon: Icon(Icons.home, size: 24.w),
                label: Text(
                  AppString.r2home,
                  style: TextStyle(fontSize: 18.sp),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.discountColor,
                  foregroundColor: Colors.white,
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.w, vertical: 12.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
