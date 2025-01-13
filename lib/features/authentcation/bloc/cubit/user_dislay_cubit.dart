import 'package:e_commerce_app/domain/usecases/auth_usecases/get_user.dart';
import 'package:e_commerce_app/features/authentcation/bloc/cubit/user_dislay_state.dart';
import 'package:e_commerce_app/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserDislayCubit extends Cubit<UserDislayState> {
  UserDislayCubit() : super(UserLoadingStte());

  void displayUser() async {
    var result = await locator<GetUserUseCase>().call();

    result.fold((error) {
      emit(LoadUserFailureState(errorMessage: error));
    }, (data) {
      emit(UserLoadedState(userEntiry: data));
    });
  }
}
