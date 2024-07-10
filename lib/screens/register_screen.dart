import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../methods/methods.dart';
import '../theme/fonts.dart';
import '../widgets/app_btn.dart';
import '../widgets/input_feild.dart';

class RegisterScreen extends StatefulWidget {
  static const String id = "RegisterScreen";
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController confirmPassword = TextEditingController();
    bool isLoading = false;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(241, 229, 209, 1),
      body: Form(
        key: formKey,
        child: ModalProgressHUD(
          inAsyncCall: isLoading,
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
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          try {
                            setState(() {
                              isLoading = true;
                            });
                            await registerAccount(
                              email: email.text,
                              password: password.text,
                            );
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              buildSnackBar(context,
                                  'The password provided is too weak.');
                            } else if (e.code == 'email-already-in-use') {
                              buildSnackBar(context,
                                  'The account already exists for that email.');
                            }
                          } catch (e) {
                            print(e);
                            buildSnackBar(context, 'There Was An Error!!');
                          }
                          setState(() {
                            isLoading = false;
                          });
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
  }
}
