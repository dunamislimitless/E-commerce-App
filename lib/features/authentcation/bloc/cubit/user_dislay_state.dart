import 'package:e_commerce_app/domain/entities/user.dart';

abstract class UserDislayState {}

class UserLoadingStte extends UserDislayState {}

class UserLoadedState extends UserDislayState {
  final UserEntity userEntiry;

  UserLoadedState({required this.userEntiry});
}

class LoadUserFailureState extends UserDislayState {
  final String errorMessage;

  LoadUserFailureState({required this.errorMessage});
}
