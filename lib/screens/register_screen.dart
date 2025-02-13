import 'package:chitchat/constants/consts.dart';
import 'package:chitchat/features/cubits/auth_cubit/auth_state.dart';

import 'package:chitchat/screens/login_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';


import '../features/cubits/auth_cubit/auth_cubit.dart';
import '../methods/methods.dart';
import '../theme/fonts.dart';
import '../widgets/app_btn.dart';
import '../widgets/input_feild.dart';

class RegisterScreen extends StatelessWidget {
  static const String id = "RegisterScreen";
  RegisterScreen({super.key});

  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController confirmPassword = TextEditingController();

    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is RegisterErrorState) {
            buildSnackBar(
              context: context,
              text: state.error,
              error: true,
            );
          } else if (state is RegisterSuccessState) {
            buildSnackBar(
              context: context,
              text: "Your Register Done Successfully",
              error: false,
            );
            Navigator.pushReplacementNamed(context, LoginScreen.id);
          }
        },
        builder: (context, state) {
          var cubit = AuthCubit.get(context);
          return Scaffold(
            backgroundColor: const Color.fromRGBO(241, 229, 209, 1),
            body: Form(
              key: formKey,
              child: ModalProgressHUD(
                inAsyncCall: state is RegisterLoadingState,
                progressIndicator: Image.asset(
                  kLoading,
                  width: 90,
                  height: 90,
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 150,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              kLogo,
                              height: 200,
                            ),
                            Text(
                              "ChitChat",
                              style: heading,
                            ),
                          ],
                        ),
                        InputField(
                          hint: "example@gmail.com",
                          title: "Email",
                          textType: TextInputType.emailAddress,
                          controller: email,
                        ),
                        InputField(
                          hint: "*****",
                          title: "Password",
                          controller: password,
                          isPassword: true,
                        ),
                        InputField(
                          hint: "*****",
                          title: "Confirm Password",
                          controller: confirmPassword,
                          isPassword: true,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: AppBtn(
                            label: "Register",
                            onPressed: () {
                              if (password.text != confirmPassword.text) {
                                buildSnackBar(
                                  context: context,
                                  text: "Password Doesn't Match",
                                  error: true,
                                );
                              } else if (formKey.currentState!.validate()) {
                                cubit.userRegister(
                                  email: email.text,
                                  password: password.text,
                                );
                              }
                            },
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already Have An Account?",
                              style: titleStyle,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                "Login",
                                style: appTitle,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
