import 'package:chitchat/cubits/login_cubit/login_cubit.dart';
import 'package:chitchat/cubits/login_cubit/login_state.dart';
import 'package:chitchat/theme/fonts.dart';
import 'package:chitchat/widgets/input_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../methods/methods.dart';
import '../widgets/app_btn.dart';
import 'register_screen.dart';

class LoginScreen extends StatelessWidget {
  static const String id = "LoginScreen";
  LoginScreen({super.key});

  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginErrorState) {
            buildSnackBar(
              context: context,
              text: state.error,
              error: true,
            );
          } else if (state is LoginSuccessState) {
            buildSnackBar(
              context: context,
              text: "Welcome To ChitChat",
              error: false,
            );
          }
        },
        builder: (context, state) {
          var cubit = LoginCubit.get(context);
          return Scaffold(
            backgroundColor: const Color.fromRGBO(241, 229, 209, 1),
            body: Form(
              key: formKey,
              child: ModalProgressHUD(
                inAsyncCall: state is LoginLoadingState,
                progressIndicator: Image.asset(
                  "assets/loading.gif",
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
                        Image.asset(
                          "assets/ChitChat.png",
                          height: 200,
                        ),
                        InputField(
                          hint: "example@gmail.com",
                          title: "Email",
                          controller: email,
                          textType: TextInputType.emailAddress,
                        ),
                        InputField(
                          hint: "*****",
                          title: "Password",
                          controller: password,
                          isPassword: true,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: AppBtn(
                            label: "Login",
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                cubit.userLogin(
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
                              "Don't Have An Account?",
                              style: titleStyle,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(RegisterScreen.id);
                              },
                              child: Text(
                                "Register",
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
