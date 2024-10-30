import 'dart:convert';

import 'package:e_commerce_app/app/extensions/extension.dart';
import 'package:e_commerce_app/app/utils/appstrings.dart';
import 'package:e_commerce_app/app/utils/colors.dart';
import 'package:e_commerce_app/app/utils/mixin/validators.dart';
import 'package:e_commerce_app/features/authentcation/bloc/auth_bloc.dart';
import 'package:e_commerce_app/features/authentcation/bloc/auth_event.dart';
import 'package:e_commerce_app/features/authentcation/bloc/auth_state.dart';
import 'package:e_commerce_app/features/authentcation/views/register.dart';
import 'package:e_commerce_app/features/authentcation/widget/custom_form_field.dart';
import 'package:e_commerce_app/features/authentcation/widget/custom_labeled_input.dart';
import 'package:e_commerce_app/features/dashboard/views/home.dart';
import 'package:e_commerce_app/features/dashboard/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class Signin extends StatefulWidget {
  Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> with Validators {
  bool obscureText = true;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authBloc = context.read<AuthBloc>();
    return Scaffold(
        body: Stack(children: [
      SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0.w),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 70.0.h,
                ),
                Text(
                  AppString.signIn,
                  style: TextStyle(
                    fontSize: 24.0.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 100.0.h),
                CustomLabeledInput(
                  controller: emailController,
                  label: AppString.email,
                  title: AppString.email,
                  prefixIcon: Icons.person_rounded,
                  validate: (value) => validateEmail(value),
                ),
                CustomLabeledInput(
                  controller: passwordController,
                  label: AppString.password,
                  title: AppString.password,
                  validate: (value) => validatePassword(value),
                  prefixIcon: Icons.lock,
                  suffix: Icon(
                          obscureText ? Icons.visibility_off : Icons.visibility)
                      .onTap(() {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  }),
                  obscureText: obscureText,
                ),
                SizedBox(
                  height: 250.h,
                ),
                BlocConsumer<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state is AuthSuccessState) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DashboardScreen()),
                      );
                    } else if (state is AuthErrorState) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.message)),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is AuthLoadingState) {
                      return Center(child: CircularProgressIndicator());
                    }

                    return CustomButton(
                      buttontext: AppString.signIn,
                      color: AppColors.discountColor,
                      onPressed: () {
                        authBloc.add(SignInEvent(
                            email: emailController.text,
                            password: passwordController.text));
                      },
                      height: 50.h,
                    );
                  },
                ),
                SizedBox(height: 8.0.h),
                CustomButton(
                  buttontext: AppString.register,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreateAccountScreen()));
                  },
                  color: AppColors.lightButton,
                  textColor: AppColors.cardColor,
                  height: 50.h,
                ),
              ],
            ),
          ),
        ),
      ),
    ]));
  }
}
