import 'package:e_commerce_app/app/utils/colors.dart';
import 'package:e_commerce_app/common/bloc/auth/auth_state_cubit.dart';
import 'package:e_commerce_app/common/bloc/auth/auth_statee.dart';
import 'package:e_commerce_app/common/bloc/button/button_state_cubit.dart';
import 'package:e_commerce_app/features/authentcation/bloc/auth_bloc.dart';
import 'package:e_commerce_app/features/authentcation/bloc/cubit/user_dislay_cubit.dart';
import 'package:e_commerce_app/features/authentcation/views/register.dart';
import 'package:e_commerce_app/features/authentcation/views/sign_in.dart';
import 'package:e_commerce_app/features/dashboard/views/home.dart';
import 'package:e_commerce_app/features/product/bloc/product_bloc_bloc.dart';
import 'package:e_commerce_app/controller/services/product_services.dart';
import 'package:e_commerce_app/features/product/models/product_model.dart';
import 'package:e_commerce_app/service_locator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/cart/cart_bloc/cart_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(414, 896),
        builder: (context, child) {
          return RepositoryProvider(
              create: (context) => ProductServices(),
              child: MultiBlocProvider(
                  providers: [
                    BlocProvider<CartBloc>(
                      create: (context) => CartBloc(),
                    ),
                    BlocProvider<ProductBlocBloc>(
                        create: (context) => ProductBlocBloc()),
                    BlocProvider<AuthBloc>(
                      create: (context) => AuthBloc(),
                    ),
                    BlocProvider<ButtonStateCubit>(
                        create: (context) => ButtonStateCubit()),
                    BlocProvider<AuthStateCubit>(
                        create: (context) => AuthStateCubit()..appStarted()),
                    BlocProvider<UserDislayCubit>(
                        create: (context) => UserDislayCubit())
                  ],
                  child: MaterialApp(
                      debugShowCheckedModeBanner: false,
                      title: 'E-commerce App',
                      theme: ThemeData(
                        colorScheme: ColorScheme.fromSeed(
                            seedColor: AppColors.discountColor),
                        useMaterial3: true,
                      ),
                      home: BlocBuilder<AuthStateCubit, AuthStatee>(
                          builder: (context, state) {
                        if (state is AuthenticatedState) {
                          return const DashboardScreen();
                        }
                        if (state is UnAuthenticatedState) {
                          return Signin();
                        }
                        return Container();
                      }))));
        });
  }
}
