import 'package:e_commerce_app/app/utils/appstrings.dart';
import 'package:e_commerce_app/app/utils/colors.dart';
import 'package:e_commerce_app/app/utils/textstyle.dart';
import 'package:e_commerce_app/common/bloc/button/button_state.dart';
import 'package:e_commerce_app/common/bloc/button/button_state_cubit.dart';

import 'package:e_commerce_app/features/authentcation/bloc/cubit/user_display_cubit.dart';
import 'package:e_commerce_app/features/authentcation/bloc/cubit/user_display_state.dart';
import 'package:e_commerce_app/features/authentcation/views/sign_in.dart';
import 'package:e_commerce_app/features/dashboard/widget/custom_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path/path.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<UserDislayCubit>().displayUser();
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
                title: const Center(child: Text('Profile')),
                automaticallyImplyLeading: false),
            body: BlocBuilder<UserDislayCubit, UserDislayState>(
                builder: (context, state) {
              if (state is UserLoadingStte) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is UserLoadedState) {
                final user = state.user;
                return SingleChildScrollView(
                    child: Padding(
                        padding: EdgeInsets.all(16.0.w),
                        child: Column(children: [
                          SizedBox(height: 20.h),
                          // CircleAvatar(
                          //   radius: 60.r,
                          //   backgroundImage: Image.network(),
                          // ),

                          ClipOval(
                              child: Image.network(user.avatar,
                                  width: 200,
                                  height: 200,
                                  errorBuilder: (_, __, ___) => Center(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color:
                                                  Colors.black.withOpacity(.1)),
                                          height: 200,
                                          width: 200,
                                          child: Icon(
                                            Icons.image_not_supported,
                                            color: Colors.black.withOpacity(.3),
                                          ),
                                        ),
                                      ))),
                          SizedBox(height: 20.h),
                          Text(user.name, style: AppText.amountText),
                          SizedBox(height: 10.h),
                          Text(
                            "User ID: ${user.id}",
                            style: TextStyle(
                                fontSize: 16.sp, color: Colors.grey[600]),
                          ),
                          SizedBox(height: 20.h),
                          Divider(color: AppColors.lightButton, thickness: 1),
                          _buildProfileDetailRow(
                              Icons.work, 'Role', '${user.role}'),

                          SizedBox(height: 30.h),

                          // TODO   Work on the signout and the navigation back to the sign in

                          CustomButton(
                            onPressed: () {
                              final logOut =
                                  context.read<UserDislayCubit>().logOut();

                              Future.delayed(Duration(seconds: 4));

                              if (logOut != null) {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Signin()));
                              }
                            },
                            buttontext: AppString.signOut,
                            height: 52.h,
                            color: AppColors.favoriteColor,
                          ),
                        ])));
              }
              if (state is LoadUserFailureState) {
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(state.errorMessage),
                      SizedBox(
                        height: 20,
                      ),
                      CustomButton(
                        onPressed: () {
                          final logOut =
                              context.read<UserDislayCubit>().logOut();

                          Future.delayed(Duration(seconds: 4));

                          if (logOut != null) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Signin()));
                          }
                        },
                        buttontext: AppString.signOut,
                        height: 52.h,
                        color: AppColors.favoriteColor,
                      ),
                    ],
                  ),
                );
              }
              return Container();
            })));
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
              const SizedBox(height: 11),
              Text(
                value,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
