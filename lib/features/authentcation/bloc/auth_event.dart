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
