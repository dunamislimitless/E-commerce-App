import 'package:e_commerce_app/app/utils/appstrings.dart';
import 'package:e_commerce_app/app/utils/colors.dart';
import 'package:e_commerce_app/app/utils/textstyle.dart';
import 'package:e_commerce_app/common/bloc/button/button_state.dart';
import 'package:e_commerce_app/common/bloc/button/button_state_cubit.dart';

import 'package:e_commerce_app/domain/usecases/auth_usecases/signout.dart';

import 'package:e_commerce_app/features/authentcation/bloc/cubit/user_dislay_cubit.dart';
import 'package:e_commerce_app/features/authentcation/bloc/cubit/user_dislay_state.dart';
import 'package:e_commerce_app/features/authentcation/views/sign_in.dart';
import 'package:e_commerce_app/features/dashboard/widget/custom_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

void iniState() {}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    // context.read<AuthBloc>().add(UserProfileEvent());

    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
                title: Center(child: Text('Profile')),
                automaticallyImplyLeading: false),
            body: BlocBuilder<UserDislayCubit, UserDislayState>(
                builder: (context, state) {
              if (state is UserLoadingStte) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is UserLoadedState) {
                final user = state.userEntiry;
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
                              child: Image.network(
                            user.avatar,
                            width: 200,
                            height: 200,
                            errorBuilder: (_, __, ___) => Container(
                              width: double.infinity,
                              child: Icon(Icons.image_not_supported_rounded),
                              padding: EdgeInsets.all(48),
                            ),
                          )),
                          SizedBox(height: 20.h),
                          Text(user.name, style: AppText.amountText),
                          SizedBox(height: 10.h),
                          Text(
                            user.role,
                            style: TextStyle(
                                fontSize: 16.sp, color: Colors.grey[600]),
                          ),
                          SizedBox(height: 20.h),
                          Divider(color: AppColors.lightButton, thickness: 1),
                          _buildProfileDetailRow(
                              Icons.phone, 'Phone', '${user.role}'),
                          _buildProfileDetailRow(Icons.location_on, 'Address',
                              '35, Glover Road Ikoyi Lagos'),
                          _buildProfileDetailRow(
                              Icons.cake, 'Gender', '${user.role}'),
                          _buildProfileDetailRow(
                              Icons.work, 'Occupation', '${user.role}'),
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

                          // TODO   Work on the signout and the navigation back to the sign in

                          BlocListener<ButtonStateCubit, ButtonStateC>(
                            listener: (context, state) {
                              if (state is ButtonSuccessState) {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Signin()));
                              }
                            },
                            child: CustomButton(
                              onPressed: () {
                                context
                                    .read<ButtonStateCubit>()
                                    .execute(usecase: SignOutUsecase());
                              },
                              buttontext: AppString.signOut,
                              height: 52.h,
                              color: AppColors.favoriteColor,
                            ),
                          )
                        ])));
              }
              if (state is LoadUserFailureState) {
                return Text(state.errorMessage);
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
