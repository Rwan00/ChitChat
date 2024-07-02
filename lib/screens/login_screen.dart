import 'package:chitchat/theme/fonts.dart';
import 'package:chitchat/widgets/input_feild.dart';
import 'package:flutter/material.dart';

import '../widgets/app_btn.dart';
import 'register_screen.dart';

class LoginScreen extends StatelessWidget {
  static const String id = "LoginScreen";
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(241, 229, 209, 1),
      body: SingleChildScrollView(
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
              const InputField(
                hint: "example@gmail.com",
                title: "Email",
              ),
              const InputField(
                hint: "*****",
                title: "Password",
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: double.infinity,
                child: AppBtn(
                  label: "Login",
                  onPressed: () {},
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
                      Navigator.of(context).pushNamed(RegisterScreen.id);
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
    );
  }
}
