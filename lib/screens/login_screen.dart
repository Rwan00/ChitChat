import 'package:chitchat/widgets/input_feild.dart';
import 'package:flutter/material.dart';

import '../widgets/app_btn.dart';

class LoginScreen extends StatelessWidget {
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
              AppBtn(label: "Login", onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
