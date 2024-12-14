import 'package:e_commerce_app/data/models/user_model.dart';
import 'package:e_commerce_app/domain/entities/user.dart';
import 'package:e_commerce_app/features/authentcation/model/user_model.dart';

abstract class AuthState {}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthSuccessState extends AuthState {}

class AuthErrorState extends AuthState {
  final String message;
  AuthErrorState(this.message);
}

class UserProfileLoadedState extends AuthState {
  final UserModel userModel;
  UserProfileLoadedState({required this.userModel});
}
