
import 'package:e_commerce_app/app/utils/mixin/navigation_mixin.dart';
import 'package:e_commerce_app/controller/services/auth_services.dart';
import 'package:e_commerce_app/features/authentcation/bloc/auth_event.dart';
import 'package:e_commerce_app/features/authentcation/bloc/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState>  with NavigationMixin{
  final auth = AuthService();

  AuthBloc() : super(AuthInitialState()) {

    on<SignInEvent>(_onSignInEvent);
    on<SignUpEvent>(_onSignUpEvent);
    
  }


  void _onSignInEvent(SignInEvent event, Emitter<AuthState> emit)async {
   
   final user = await auth.signInWithEmailAndPassword(event.email, event.password);
    
    if (user != null) {
      emit(AuthSuccessState());  } else {

      emit(AuthErrorState("Please enter email and password!"));
    }
  }

 void _onSignUpEvent(SignUpEvent event, Emitter<AuthState> emit) async {
   
   

    
   

    final user = await  auth.createUserWithEmailAndPassword(event.email, event.password );
    if(user !=null){
      debugPrint('User Created Successfully');
     
    

      emit(AuthSuccessState());  } else {

      emit(AuthErrorState("Unable to register Account, enter email and password!"));
    }
}

}