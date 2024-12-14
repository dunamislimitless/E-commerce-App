import 'package:e_commerce_app/app/utils/mixin/navigation_mixin.dart';
import 'package:e_commerce_app/controller/services/auth_services.dart';
import 'package:e_commerce_app/controller/services/profile_services.dart';
import 'package:e_commerce_app/features/authentcation/bloc/auth_event.dart';
import 'package:e_commerce_app/features/authentcation/bloc/auth_state.dart';
import 'package:e_commerce_app/features/authentcation/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> with NavigationMixin {
  // final auth = AuthService();
  // final userService = ProfileServices();

  // final userDb = UserServices();

  AuthBloc() : super(AuthInitialState()) {
    // on<SignInEvent>(onSignInEvent);
    // on<SignUpEvent>(onSignUpEvent);
    // on<SignOutEvent>(logOut);
    // on<UserProfileEvent>(userProfile);
    // on<AddUserEvent>(addUser);
  }

  onSignInEvent() {}

  // void onSignInEvent(SignInEvent event, Emitter<AuthState> emit) async {
  //   emit(AuthLoadingState());

  //   final call =
  //       await auth.signInWithEmailAndPassword(event.email, event.password);

  //   if (call.user != null) {
  //     emit(AuthSuccessState());
  //    // emit(AuthErrorState("${auth.userId}"));
  //   } else {
  //     emit((AuthErrorState(call.error ?? "Unknown Error")));
  //   }
  // }

  // void onSignUpEvent(SignUpEvent event, Emitter<AuthState> emit) async {
  //   emit(AuthLoadingState());
  //   final model = UserModel(
  //       firstName: event.firstName,
  //       lastName: event.lastName,
  //       phoneNumber: event.phoneNumber,
  //       createdAt: DateTime.now(),
  //       gender: event.gender);

  //   final call = await auth.createUserWithEmailAndPassword(
  //       email: event.email, password: event.password, model: model);

  //   if (call.user != null) {
  //     debugPrint('User Created Successfully');

  //     emit(AuthSuccessState());
  //   } else {
  //     emit(AuthErrorState(call.error ??
  //         "Unable to register Account, enter email and password!"));
  //   }
  // }

  // void userProfile(UserProfileEvent event, Emitter<AuthState> emit) async {
  //   emit(AuthLoadingState());

  //   final userProfile = await userService.getData('${auth.userId}');

  //   if (userProfile != null) {
  //     debugPrint('NORMAL NORMAL ${userProfile}');
  //     emit(UserProfileLoadedState (userModel: userProfile));
  //   } else {
  //     emit(AuthErrorState("Failed to fetch user profile."));
  //   }
  // }

  // void addUser(AddUserEvent event, Emitter<AuthState> emit) async {
  //   await Future.delayed(Duration(seconds: 1));
  //   emit(AuthLoadingState());
  //   try {
  //     await userDb.create(
  //         firstName: event.firstName,
  //         lastName: event.lastName,
  //         occupation: event.occupation,
  //         gender: event.gender,
  //         phoneNumber: event.phoneNumber,
  //         email: event.email);
  //     emit(AuthSuccessState());
  //   } catch (e) {
  //     emit(AuthErrorState(e.toString()));
  //   }
  // }

  // void logOut(SignOutEvent event, Emitter<AuthState> emit) async {
  //   emit(AuthLoadingState());

  //   try {
  //     await auth.signOut();
  //     emit(AuthSuccessState());

  //     debugPrint('LOGOUT SUCCESSFULY');
  //   } catch (e) {
  //     emit(AuthErrorState(e.toString() ?? "Unknown Error"));
  //   }
  // }
}
