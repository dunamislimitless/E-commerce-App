import 'package:e_commerce_app/app/extensions/extension.dart';
import 'package:e_commerce_app/app/utils/app_ipngs.dart';
import 'package:e_commerce_app/app/utils/appstrings.dart';
import 'package:e_commerce_app/app/utils/colors.dart';
import 'package:e_commerce_app/app/utils/textstyle.dart';
import 'package:e_commerce_app/features/authentcation/bloc/auth_bloc.dart';
import 'package:e_commerce_app/features/authentcation/bloc/auth_event.dart';
import 'package:e_commerce_app/features/authentcation/bloc/auth_state.dart';
import 'package:e_commerce_app/features/authentcation/views/sign_in.dart';
import 'package:e_commerce_app/features/dashboard/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: Center(child: Text('Profile')),
            automaticallyImplyLeading: false),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0.w),
            child: Column(
              children: [
                SizedBox(height: 20.h),
                CircleAvatar(
                  radius: 60.r,
                  backgroundImage: AssetImage(AppImage.flower),
                ),
                SizedBox(height: 20.h),
                Text('Samuel O.', style: AppText.amountText),
                SizedBox(height: 10.h),
                Text(
                  'ogundojusamuel@gmail.com',
                  style: TextStyle(fontSize: 16.sp, color: Colors.grey[600]),
                ),
                SizedBox(height: 20.h),
                Divider(color: AppColors.lightButton, thickness: 1),
                _buildProfileDetailRow(Icons.phone, 'Phone', '+2347069332491'),
                _buildProfileDetailRow(Icons.location_on, 'Address',
                    '35, Glover Road Ikoyi Lagos'),
                _buildProfileDetailRow(Icons.cake, 'Birthday', 'January 1,'),
                _buildProfileDetailRow(
                    Icons.work, 'Occupation', 'Software Engineer'),
                SizedBox(height: 30.h),
                // Align(
                //   alignment: Alignment.bottomRight,
                //   child: Text(AppString.signOut,
                //           style: TextStyle(color: Colors.red))
                //       .onTap(
                //     () {
                //       final authBloc = context.read<AuthBloc>();

                //       authBloc.add(SignOutEvent());
                //     },
                //   ),
                // ),
                BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
                  if (state is AuthSuccessState) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Signin()));
                  } else if (state is AuthErrorState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.message)),
                    );
                  }
                }, builder: (context, state) {
                  if (state is AuthLoadingState) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return CustomButton(
                    onPressed: () {
                      final authBloc = context.read<AuthBloc>();

                      authBloc.add(SignOutEvent());
                    },
                    buttontext: AppString.signOut,
                    height: 52.h,
                    color: AppColors.favoriteColor,
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileDetailRow(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        children: [
          Icon(icon, color: AppColors.lightButton),
          SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
              SizedBox(height: 11),
              Text(
                value,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
