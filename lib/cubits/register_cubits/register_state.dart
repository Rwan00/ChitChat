abstract class RegisterState {}

class RegisterInitialState extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterSuccessState extends RegisterState {}

class RegisterErrorState extends RegisterState {
  final String error;
  RegisterErrorState({required this.error});
}

class AppChangePasswordVisibility extends RegisterState{}
