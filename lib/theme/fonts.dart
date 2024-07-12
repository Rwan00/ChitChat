import 'package:chitchat/constants/consts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle get heading {
  return GoogleFonts.actor(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: kBrownColor,
  );
}

TextStyle get appTitle {
  return GoogleFonts.actor(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: kBrownColor,
    decoration: TextDecoration.underline,
  );
}

TextStyle get subTitle {
  return GoogleFonts.actor(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
}

TextStyle get titleStyle {
  return GoogleFonts.actor(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
}
