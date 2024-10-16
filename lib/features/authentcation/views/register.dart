import 'package:e_commerce_app/app/utils/colors.dart';
import 'package:e_commerce_app/app/utils/mixin/navigation_mixin.dart';
import 'package:e_commerce_app/app/utils/textstyle.dart';
import 'package:e_commerce_app/features/authentcation/bloc/auth_bloc.dart';
import 'package:e_commerce_app/features/authentcation/bloc/auth_event.dart';
import 'package:e_commerce_app/features/authentcation/bloc/auth_state.dart';
import 'package:e_commerce_app/features/authentcation/views/sign_in.dart';
import 'package:e_commerce_app/features/authentcation/widget/custom_labeled_input.dart';
import 'package:e_commerce_app/features/dashboard/views/home.dart';
import 'package:e_commerce_app/features/dashboard/widget/custom_button.dart';
import 'package:e_commerce_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CreateAccountScreen extends StatelessWidget with NavigationMixin {
 

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
              SizedBox(height: 69.0.h), // Add spacing at the top
              Text('Create an Account', style: AppText.cartText),
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
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0.r),
            border: Border.all(
              color: Colors.black,
              width: 1.0.r,
            ),
          ),
          child:  Padding(
            padding:  EdgeInsets.only(left:12.0.h),
            child: DropdownButtonFormField<String>(
                    value: authBloc.genderController.text.isEmpty
                        ? null
                        : authBloc.genderController.text,
                    items: const [
                      DropdownMenuItem(value: 'male', child: Text('Male')),
                      DropdownMenuItem(value: 'female', child: Text('Female')),
                    ],
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 18.0.h),
                    ),
                    onChanged: (String? value) {
                      if (value != null) {
                        // Update the genderController text when a selection is made
                        authBloc.genderController.text = value;
                      }
                    },
                  ),
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
             
              SizedBox(height: 50.0.h),

       BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is AuthSuccessState) {
                    goToHome(context);
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
                    buttontext: 'Register',
                    onPressed: () {
                      
                      authBloc.add(SignUpEvent());
                    },
                    height: 50.h,
                  );
                },
              ),

              SizedBox(height: 16.0.h),
              CustomButton(
                buttontext: 'Sign In',
                onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> Signin()));},
                color: AppColors.discountColor,
                textColor: AppColors.cardColor,
                height: 50.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
