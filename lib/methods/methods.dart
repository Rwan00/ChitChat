import 'package:chitchat/constants/consts.dart';
import 'package:chitchat/theme/fonts.dart';

import 'package:flutter/material.dart';



void buildSnackBar({required BuildContext context,required String text,required bool error}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor:error?kErrorColor: kBrownColor,
      
      content: Text(
        text,
        style: titleStyle,
      ),
    ),
  );
}

 
