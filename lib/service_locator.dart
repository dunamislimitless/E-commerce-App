import 'package:e_commerce_app/core/network/dio_client.dart';
import 'package:e_commerce_app/data/repository/auth.dart';
import 'package:e_commerce_app/data/repository/product.dart';
import 'package:e_commerce_app/data/source/auth_api_service.dart';
import 'package:e_commerce_app/data/source/auth_local_service.dart';
import 'package:e_commerce_app/data/source/product_api_service.dart';
import 'package:e_commerce_app/domain/repository/auth.dart';
import 'package:e_commerce_app/domain/repository/product.dart';
import 'package:e_commerce_app/domain/usecases/auth_usecases/get_user.dart';
import 'package:e_commerce_app/domain/usecases/auth_usecases/is_logged_in.dart';
import 'package:e_commerce_app/domain/usecases/auth_usecases/log_in.dart';
import 'package:e_commerce_app/domain/usecases/auth_usecases/signout.dart';
import 'package:e_commerce_app/domain/usecases/auth_usecases/signup.dart';
import 'package:e_commerce_app/domain/usecases/product_usecase.dart/category_usecase.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupServiceLocator() {
  locator.registerSingleton<DioClient>(DioClient());

  //service
  locator.registerSingleton<AuthApiService>(AuthApiServiceImplement());

  locator.registerSingleton<AuthLocalService>(AuthLocalServiceImplmentation());
  locator.registerSingleton<ProductApiService>(ProductApiServiceImplement());

// Repositories...

  locator.registerSingleton<AuthRepository>(AuthRepositoryImplementation());
  //locator.registerSingleton<ProductRepository>(ProductRepositoryImplementation());

//usecases

  locator.registerSingleton<SignupCase>(SignupCase());

  locator.registerSingleton<SignOutUsecase>(SignOutUsecase());

  locator.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());

  locator.registerSingleton<GetUserUseCase>(GetUserUseCase());

  locator.registerSingleton<SignInUsecae>(SignInUsecae());

  // locator.registerSingleton<GetProductUsecase>(GetProductUsecase());
}
