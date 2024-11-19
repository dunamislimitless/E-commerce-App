import 'package:e_commerce_app/features/authentcation/model/user_model.dart';

abstract class AuthEvent {}

class SignInEvent extends AuthEvent {
  final String email;
  final String password;

  SignInEvent({required this.email, required this.password});
}

class SignUpEvent extends AuthEvent {
  final String email;
  final String password;
  final String gender;
  final String firstName;
  final String lastName;
  final String phoneNumber;

  SignUpEvent(
      {required this.email,
      required this.password,
      required this.lastName,
      required this.firstName,
      required this.gender,
      required this.phoneNumber});
}

class UserProfileEvent extends AuthEvent {
  // final List<UserModel> userModel;
  // final String userId;
}

class SignOutEvent extends AuthEvent {}

// class AddUserEvent extends AuthEvent {
//   final String firstName;
//   final String lastName;
//   final String email;
//   final String gender;
//   final String phoneNumber;
//   final String occupation;
//   AddUserEvent(this.phoneNumber,
//       {required this.firstName,
//       required this.lastName,
//       required this.gender,
//       required this.occupation,
//       required this.email});
// }
