import 'package:chitchat/constants/consts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBtn extends StatelessWidget {
  final void Function()? onPressed;
  final String label;
  final Color? clr;
  final TextStyle? style;
  const AppBtn(
      {required this.label,
      required this.onPressed,
      this.clr,
      this.style,
      super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          foregroundColor: WidgetStateProperty.all(Colors.white),
          textStyle: WidgetStateProperty.all(GoogleFonts.raleway(fontSize: 16)),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          backgroundColor:
              WidgetStateProperty.all(clr ?? brownColor.withOpacity(0.6))),
      child: Text(
        label,
        style: style,
      ),
    );
  }
}
