import 'package:chitchat/firebase_options.dart';
import 'package:chitchat/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';


import 'screens/register_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const ChitChat());
}

class ChitChat extends StatelessWidget {
  const ChitChat({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        LoginScreen.id: (context) => const LoginScreen(),
        RegisterScreen.id: (context) =>  RegisterScreen(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple,),
        useMaterial3: true,
      ),
      initialRoute: LoginScreen.id,
    );
  }
}
