import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

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
      if (e.code == 'weak-password') {
        emit(
          RegisterErrorState(error: "'The password provided is too weak.'"),
        );
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterErrorState(
            error: "'The account already exists for that email.'"));
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
