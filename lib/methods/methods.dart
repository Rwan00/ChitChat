import 'package:chitchat/constants/consts.dart';
import 'package:chitchat/theme/fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

void navigateToAndDelete(context, widget) => Navigator.pushReplacement(
    context, MaterialPageRoute(builder: (context) => widget));

void buildSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: kBrownColor,
      
      content: Text(
        text,
        style: titleStyle,
      ),
    ),
  );
}

 Future<void> registerAccount({required String email, required String password}) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
