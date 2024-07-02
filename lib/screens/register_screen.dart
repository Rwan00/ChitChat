import 'package:flutter/material.dart';

import '../theme/fonts.dart';
import '../widgets/app_btn.dart';
import '../widgets/input_feild.dart';

class RegisterScreen extends StatelessWidget {
  static const String id = "RegisterScreen";
  const RegisterScreen({super.key});

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
              const InputField(
                hint: "*****",
                title: "Confirm Password",
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: double.infinity,
                child: AppBtn(
                  label: "Register",
                  onPressed: () {},
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
    );
  }
}
