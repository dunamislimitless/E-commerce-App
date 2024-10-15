abstract class AuthState {}


class AuthInitialState extends AuthState{}

class AuthSuccessState extends AuthState {}

class AuthErrorState extends AuthState {
  final String message;
  AuthErrorState(this.message);
}