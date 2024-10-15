import 'package:e_commerce_app/app/utils/colors.dart';
import 'package:e_commerce_app/app/utils/textstyle.dart';
import 'package:e_commerce_app/features/authentcation/bloc/auth_bloc.dart';
import 'package:e_commerce_app/features/authentcation/widget/custom_labeled_input.dart';
import 'package:e_commerce_app/features/dashboard/views/home.dart';
import 'package:e_commerce_app/features/dashboard/widget/custom_button.dart';
import 'package:e_commerce_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CreateAccountScreen extends StatelessWidget {
 

  CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authBloc = context.read<AuthBloc>();
    
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.0.h), // Add spacing at the top
              Text('Create an Account', style: AppText.discountText),
              SizedBox(height: 48.0.h),
            
              Row(
                children: [
                  Expanded(
                    child: CustomLabeledInput(
                      label: 'First Name',
                      title: 'First Name',
                      prefixIcon: Icons.person,
                      controller: authBloc.firstNameController,
                      keyboardType: TextInputType.name,
                    ),
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  Expanded(
                    child: CustomLabeledInput(
                      label: 'Last Name',
                      title: 'Last Name',
                      prefixIcon: Icons.person,
                      controller: authBloc.lastNameControler,
                      keyboardType: TextInputType.name,
                    ),
                  ),
                ],
              ),
              const Text(
                'Gender',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              SizedBox(height: 6.0.h),
             Container(
                  height: 56.h,
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0.r),
                    border: Border.all(
                      color: Colors.black,
                      width: 1.0.r,
                    ),
                  ),
                  child: DropdownButtonFormField<String>(
                    value: authBloc.genderController.text,
                    items: const [
                      DropdownMenuItem(value: 'male', child: Text('Male')),
                      DropdownMenuItem(value: 'female', child: Text('Female')),
                    ],
                  
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 18.0.h),
                    ), onChanged: (String? value) {  },
                  ),
                ),
              SizedBox(height: 24.0.h),
           
              CustomLabeledInput(
                label: 'Email Address',
                title: 'Email',
                prefixIcon: Icons.email,
                controller: authBloc.emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              CustomLabeledInput(
                label: 'Phone Number',
                title: 'Phone Number',
                prefixIcon: Icons.numbers,
                controller: authBloc.phoneController,
                keyboardType: TextInputType.number,
              ),
             
              SizedBox(height: 12.0.h),

       CustomButton(
                    buttontext: 'Register',
                    onPressed: 
                      
                         () {
                          
                          },
       ),

              SizedBox(height: 16.0.h),
              CustomButton(
                buttontext: 'Sign In',
                onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> DashboardScreen()));},
                color: AppColors.discountColor,
                textColor: AppColors.cardColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
