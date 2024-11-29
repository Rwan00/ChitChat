

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'auth_event.dart';
import 'auth_state.dart';



class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
     
    on<AuthEvent>((event, emit) async{
     if(event is LoginEvent){
      emit(LoginLoadingState());
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
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
    });
  }
}
