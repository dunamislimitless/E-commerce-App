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
import 'package:e_commerce_app/domain/usecases/product_usecase.dart/product_usecase.dart';
import 'package:get_it/get_it.dart';

final s1 = GetIt.instance;

void setupServiceLocator() {
  s1.registerSingleton<DioClient>(DioClient());

  //service
  s1.registerSingleton<AuthApiService>(AuthApiServiceImplement());

  s1.registerSingleton<AuthLocalService>(AuthLocalServiceImplmentation());
  s1.registerSingleton<ProductApiService>(ProductApiServiceImplement());

// Repositories...

  s1.registerSingleton<AuthRepository>(AuthRepositoryImplementation());
  s1.registerSingleton<ProductRepository>(ProductRepositoryImplementation());

//usecases

  s1.registerSingleton<SignupCase>(SignupCase());

  s1.registerSingleton<SignOutUsecase>(SignOutUsecase());

  s1.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());

  s1.registerSingleton<GetUserUseCase>(GetUserUseCase());

  s1.registerSingleton<SignInUsecae>(SignInUsecae());

  // s1.registerSingleton<GetProductUsecase>(GetProductUsecase());

  s1.registerSingleton<GetCaregoryUsecase>(GetCaregoryUsecase());

  s1.registerSingleton<SingleItemUseCase>(SingleItemUseCase());
}
