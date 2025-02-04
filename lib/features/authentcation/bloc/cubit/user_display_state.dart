import 'package:e_commerce_app/data/models/auth_modal/user_model.dart';
import 'package:e_commerce_app/domain/entities/user.dart';
import 'package:e_commerce_app/features/authentcation/model/user_model.dart';

abstract class UserDislayState {}

class UserLoadingStte extends UserDislayState {}

class UserLoadedState extends UserDislayState {
  final UserModellls user;

  UserLoadedState({required this.user});
}

class LoadUserFailureState extends UserDislayState {
  final String errorMessage;

  LoadUserFailureState({required this.errorMessage});
}
