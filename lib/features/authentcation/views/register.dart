import 'package:e_commerce_app/app/extensions/extension.dart';
import 'package:e_commerce_app/app/utils/appstrings.dart';
import 'package:e_commerce_app/app/utils/colors.dart';
import 'package:e_commerce_app/app/utils/mixin/validators.dart';
import 'package:e_commerce_app/app/utils/textstyle.dart';
import 'package:e_commerce_app/features/authentcation/bloc/auth_bloc.dart';
import 'package:e_commerce_app/features/authentcation/bloc/auth_state.dart';
import 'package:e_commerce_app/features/authentcation/views/sign_in.dart';
import 'package:e_commerce_app/features/authentcation/widget/custom_labeled_input.dart';
import 'package:e_commerce_app/features/dashboard/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../bloc/auth_event.dart';

class CreateAccountScreen extends StatefulWidget {
  CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen>  with validators{
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();

  final TextEditingController gender = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
   bool obscure = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    firstName.dispose();
    lastName.dispose();
    gender.dispose();
    phoneController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authBloc = context.read<AuthBloc>();

    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 60.0.h), 
                Text(AppString.createAccount, style: AppText.cartText),
                SizedBox(height: 38.0.h),

                Row(
                  children: [
                    Expanded(
                      child: CustomLabeledInput(
                        validate: (x) =>
                            (x?.length ?? 0) > 2 ? null : '${AppString.invalid} ${AppString.firstName}',
                        label: AppString.firstName,
                        title: AppString.firstName,
                        prefixIcon: Icons.person,
                        controller: firstName,
                        keyboardType: TextInputType.name,
                      ),
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    Expanded(
                      child: CustomLabeledInput(
                        validate: (x) =>
                           (x?.length ?? 0) > 2 ? null :'${AppString.invalid} ${AppString.lastName}',
                        label: AppString.lastName,
                        title: AppString.lastName,
                        prefixIcon: Icons.person,
                        controller: lastName,
                        keyboardType: TextInputType.name,
                      ),
                    ),
                  ],
                ),
                 const Text(
                  AppString.gender,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
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
                  child: Padding(
                    padding: EdgeInsets.only(left: 12.0.h),
                    child: DropdownButtonFormField<String>(
                      value: gender.text.isEmpty ? null : gender.text,
                      items: const [
                        DropdownMenuItem(value: AppString.male, child: Text(AppString.male)),
                        DropdownMenuItem(
                            value: AppString.female, child: Text(AppString.female)),
                      ],
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 18.0.h),
                      ),
                      onChanged: (String? value) {
                        if (value != null) {
                         
                          gender.text = value;
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(height: 24.0.h),

                CustomLabeledInput(
                  label: AppString.email,
                  title: AppString.email,
                  prefixIcon: Icons.email,
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  validate: (value) => validateEmail(value),
                 
                ),
                CustomLabeledInput(
                  label: AppString.password,
                  title: AppString.password,
                  prefixIcon: Icons.security,
                  controller: passwordController,
                  keyboardType: TextInputType.text,
                   obscureText: obscure,
                   suffix: Icon(obscure? Icons.visibility_off: Icons.visibility, color: AppColors.lightButton,).onTap((){setState(() {
        obscure = !obscure;  // 
      });})
                    
                ),

                 const Text(
          AppString.number,
          style:  TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 8.0.h),
           IntlPhoneField(
     inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
            decoration:       InputDecoration(
              labelText: AppString.number,
            
              border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black,
              width: 2.0.r)),
            ),
                  controller: phoneController,
                
                  keyboardType: TextInputType.number,
                )
                // CustomLabeledInput(
                //   inputFormatters: [
                //     FilteringTextInputFormatter.digitsOnly,
                //   ],
                //   validate: (x) =>
                //       (x?.length ?? 0) > 10 ? null : 'Invalid Phone number',
                //   label: 'Phone Number',
                //   title: 'Phone Number',
                //   prefixIcon: Icons.numbers,
                //   controller: phoneController,
                //   keyboardType: TextInputType.number,
                // ),
,
                SizedBox(height: 20.0.h),

                BlocConsumer<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state is AuthSuccessState) {
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
                      buttontext: AppString.register,
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          authBloc.add(SignUpEvent(
                            phoneNumber: phoneController.text,
                            email: emailController.text,
                            password: passwordController.text,
                            lastName: lastName.text,
                            firstName: firstName.text,
                            gender: gender.text,
                          ));
                        }
                      },
                      height: 50.h,
                    );
                  },
                ),

                SizedBox(height: 16.0.h),
                CustomButton(
                  buttontext: AppString.signIn,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Signin()));
                  },
                  color: AppColors.discountColor,
                  textColor: AppColors.cardColor,
                  height: 50.h,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomFormatter extends FilteringTextInputFormatter {
  CustomFormatter(super.filterPattern, {required super.allow});

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // TODO: implement formatEditUpdate
    return super.formatEditUpdate(oldValue, newValue);
  }
}
