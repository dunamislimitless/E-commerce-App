import 'package:e_commerce_app/common/bloc/auth/auth_statee.dart';
import 'package:e_commerce_app/domain/usecases/is_logged_in.dart';
import 'package:e_commerce_app/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthStateCubit extends Cubit<AuthStatee> {
  AuthStateCubit() : super(AuthIntialState());

  void appStarted() async {
    var isLoggedIn = await s1<IsLoggedInUseCase>().call();
    if (isLoggedIn) {
      emit(AuthenticatedState());
    } else {
      emit(UnAuthenticatedState());
    }
  }
}
