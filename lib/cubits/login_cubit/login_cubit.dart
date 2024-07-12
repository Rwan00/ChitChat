
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) =>  BlocProvider.of(context);

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
      if (e.code == 'user-not-found') {
        emit(LoginErrorState(error: "No user found for that email."));
      } else if (e.code == 'wrong-password') {
        emit(LoginErrorState(error: 'Wrong password provided for that user.'));
      }
    } catch (e) {
      print(e);
      emit(LoginErrorState(error: "'There Was An Error!!'"));
    }
  }
}
