import 'package:e_commerce_app/app/utils/colors.dart';
import 'package:e_commerce_app/features/authentcation/bloc/auth_bloc.dart';
import 'package:e_commerce_app/features/authentcation/views/sign_in.dart';
import 'package:e_commerce_app/features/dashboard/views/home.dart';
import 'package:e_commerce_app/features/product/bloc/product_bloc_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/cart/cart_bloc/cart_bloc.dart';

void main() async{
  
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(414, 896),
        builder: (context, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<CartBloc>(
                create: (context) => CartBloc(),
              ),
              BlocProvider<ProductBlocBloc>(
                create: (context) => ProductBlocBloc(),
              ) , BlocProvider<AuthBloc>(
                create: (context) => AuthBloc(),
              ),
            ],

            child: MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                theme: ThemeData(
                  colorScheme:
                      ColorScheme.fromSeed(seedColor: AppColors.discountColor),
                  useMaterial3: true,
                ),
                home:  Signin()),
          );
        });
  }
}
