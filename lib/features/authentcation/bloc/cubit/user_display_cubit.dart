import 'package:e_commerce_app/data/source/auth_local_service.dart';
import 'package:e_commerce_app/domain/repository/auth.dart';
import 'package:e_commerce_app/features/authentcation/bloc/cubit/user_display_state.dart';
import 'package:e_commerce_app/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserDislayCubit extends Cubit<UserDislayState> {
  UserDislayCubit({required this.authRepository}) : super(UserLoadingStte());

  final AuthRepository authRepository;

  void displayUser() async {
    var result = await authRepository.getUser();

    result.fold((error) {
      emit(LoadUserFailureState(errorMessage: error));
    }, (data) {
      emit(UserLoadedState(user: data));
    });
  }

  Future<void> logOut() async {
    await authRepository.logOut();
  }
}
