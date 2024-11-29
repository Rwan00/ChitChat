import 'package:chitchat/firebase_options.dart';
import 'package:chitchat/screens/chat_screen.dart';
import 'package:chitchat/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'features/simple_bloc_observer.dart';
import 'screens/register_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
 Bloc.observer = SimpleBlocObserver();
  runApp(const ChitChat());
}

class ChitChat extends StatelessWidget {
  const ChitChat({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        LoginScreen.id: (context) =>  LoginScreen(),
        RegisterScreen.id: (context) =>  RegisterScreen(),
        ChatScreen.id:(context)=>const ChatScreen(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple,),
        useMaterial3: true,
      ),
      initialRoute: LoginScreen.id,
    );
  }
}
