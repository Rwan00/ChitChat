



import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);

  void userLogin({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(LoginSuccessState());
    } on FirebaseAuthException catch (e) {
      print(e.code);
      if (e.code == 'invalid-credential') {
        emit(LoginErrorState(
            error: 'Wrong password Or Email provided for that user.'));
      } else if (e.code == 'invalid-email') {
        emit(LoginErrorState(error: 'You had Entered An Invalid Email.'));
      }
    } catch (e) {
      print(e);
      emit(LoginErrorState(error: "There Was An Error!!"));
    }
  }

  void userRegister({
    required String email,
    required String password,
  }) async {
    emit(RegisterLoadingState());
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(RegisterSuccessState());
    } on FirebaseAuthException catch (e) {
      print(e.code);
      if (e.code == 'weak-password') {
        emit(
          RegisterErrorState(error: "The password provided is too weak."),
        );
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterErrorState(
            error: "The account already exists for that email."));
      }else if (e.code == 'invalid-email') {
        emit(RegisterErrorState(error: 'You had Entered An Invalid Email.'));
      }
    } catch (e) {
      print(e);
      emit(RegisterErrorState(error: "'There Was An Error!!'"));
    }
  }

  Widget icon = const Icon(Icons.remove_red_eye_outlined);
  bool showPwd = false;

  void changePasswordVisibility() {
    showPwd = !showPwd;
    icon = showPwd
        ? const Icon(Icons.visibility_off_outlined)
        : const Icon(Icons.visibility_outlined);
    emit(AppChangePasswordVisibility());
  }
}
