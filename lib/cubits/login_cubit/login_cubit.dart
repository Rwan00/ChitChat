import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

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
      emit(LoginErrorState(error: "'There Was An Error!!'"));
    }
  }
}
