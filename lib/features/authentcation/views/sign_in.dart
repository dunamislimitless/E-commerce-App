import 'dart:convert';

import 'package:e_commerce_app/app/utils/colors.dart';
import 'package:e_commerce_app/features/authentcation/bloc/auth_bloc.dart';
import 'package:e_commerce_app/features/authentcation/bloc/auth_event.dart';
import 'package:e_commerce_app/features/authentcation/views/register.dart';
import 'package:e_commerce_app/features/authentcation/widget/custom_form_field.dart';
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


class _SigninState extends State<Signin> {

 
final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
@override
void dispose(){
  emailController.dispose();
  passwordController.dispose();
  super.dispose();

}

  @override
  Widget build(BuildContext context) {
       final authBloc = context.read<AuthBloc>(); 
    return Scaffold(
      body:
         Stack(
          children: [
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
                        'Sign In',
                        style: TextStyle(
                          fontSize: 24.0.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 100.0.h),
                      CustomFormField(
                        controller: emailController,
                        label: 'Email',
                        title: 'Email',
                        prefixIcon: Icons.person_rounded,
                      ),
                      CustomFormField(
                        controller: passwordController,
                        label: 'Password',
                        title: 'Password',
                        prefixIcon: Icons.lock,
                        obscureText: true,
                      ),
                      SizedBox(
                        height: 250.h,
                      ),

                      
                      
                      CustomButton(
                        buttontext: 'Sign In',
                        onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> DashboardScreen() ));
                       authBloc.add(SignInEvent(email: emailController.text, password: passwordController.text));
                        },
                        color: AppColors.discountColor,
                        textColor: AppColors.cardColor,
                        height: 50.h,
                      ),

                      SizedBox(height: 8.0.h),
                      CustomButton(
                        buttontext: 'Register',
                        onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> CreateAccountScreen() ));
                       
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
            
          
          ]




         )  
    );
  }
}
