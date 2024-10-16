
import 'package:e_commerce_app/app/utils/mixin/navigation_mixin.dart';
import 'package:e_commerce_app/controller/services/auth_services.dart';
import 'package:e_commerce_app/features/authentcation/bloc/auth_event.dart';
import 'package:e_commerce_app/features/authentcation/bloc/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState>  with NavigationMixin{
  final auth = AuthService();
 
final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameControler = TextEditingController();
  
final TextEditingController genderController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  
  
  

  AuthBloc() : super(AuthInitialState()) {

     on<SignInEvent>(_onSignInEvent);
    on<SignUpEvent>(_onSignUpEvent);
    
  }


  void _onSignInEvent(SignInEvent event, Emitter<AuthState> emit) {
   
   
    final email = emailController.text;
    final password = passwordController.text;

    
    if (email.isNotEmpty && password.isNotEmpty) {
      emit(AuthSuccessState());  } else {

      emit(AuthErrorState("Please enter email and password!"));
    }
}

 void _onSignUpEvent(SignUpEvent event, Emitter<AuthState> emit) async {
   
   
    final email = emailController.text;
    final password = passwordController.text;

    
    if (email.isNotEmpty && password.isNotEmpty) {

    final user = await  auth.createUserWithEmailAndPassword(email, password );
    if(user !=null){
      debugPrint('User Created Successfully');
     
    }

      emit(AuthSuccessState());  } else {

      emit(AuthErrorState("Unable to register Account, enter email and password!"));
    }
}


Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }}