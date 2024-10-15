
import 'package:e_commerce_app/features/authentcation/bloc/auth_event.dart';
import 'package:e_commerce_app/features/authentcation/bloc/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
 
final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameControler = TextEditingController();
  
final TextEditingController genderController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  
  
  

  AuthBloc() : super(AuthInitialState()) {

    on<SignInEvent>(_onSignInEvent);
    
  }
  void _onSignInEvent(SignInEvent event, Emitter<AuthState> emit) {
   
   
    final email = emailController.text;
    final password = passwordController.text;

    
    if (email.isNotEmpty && password.isNotEmpty) {
      emit(AuthSuccessState());  } else {

      emit(AuthErrorState("Please enter email and password!"));
    }
}
Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }}