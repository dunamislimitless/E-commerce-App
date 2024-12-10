import 'package:e_commerce_app/core/network/dio_client.dart';
import 'package:e_commerce_app/core/usecase/usecase.dart';
import 'package:e_commerce_app/data/repository/auth.dart';
import 'package:e_commerce_app/data/source/auth_api_service.dart';
import 'package:e_commerce_app/data/source/auth_local_service.dart';
import 'package:e_commerce_app/domain/repository/auth.dart';
import 'package:e_commerce_app/domain/usecases/get_user.dart';
import 'package:e_commerce_app/domain/usecases/is_logged_in.dart';
import 'package:e_commerce_app/domain/usecases/signup.dart';
import 'package:get_it/get_it.dart';

final s1 = GetIt.instance;

void setupServiceLocator() {
  s1.registerSingleton<DioClient>(DioClient());

  //service
  s1.registerSingleton<AuthApiService>(AuthApiServiceImplement());

  s1.registerSingleton<AuthLocalService>(AuthLocalServiceImplmentation());

// Repositories...

  s1.registerSingleton<AuthRepository>(AuthRepositoryImplementation());

//usecases

  s1.registerSingleton<SignupCase>(SignupCase());

  s1.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());

  s1.registerSingleton<GetUserUseCase>(GetUserUseCase());
}
