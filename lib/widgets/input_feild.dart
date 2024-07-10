import 'package:chitchat/constants/consts.dart';
import 'package:flutter/material.dart';

import '../theme/fonts.dart';

class InputField extends StatefulWidget {
  final String? title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;
  final TextInputType? textType;
  final bool isPassword;

  const InputField(
      {this.title,
      required this.hint,
      this.controller,
      this.widget,
      this.textType,
      this.isPassword = false,
      super.key});

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    bool showPwd = false;
     Widget icon = const Icon(Icons.remove_red_eye_outlined);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null)
          Text(
            widget.title!,
            style: titleStyle,
          ),
        const SizedBox(
          height: 4,
        ),
        Container(
          //height: 80,
          //margin: const EdgeInsets.only(bottom: 18),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            //borderRadius: BorderRadius.circular(12),
          ),
          child: TextFormField(
            validator: (data) {
              if (data!.isEmpty) {
                return "**Field Is Required!";
              }
              return null;
            },
            obscureText: widget.isPassword && !showPwd,
            controller: widget.controller,
            keyboardType: widget.textType,
            autofocus: false,
            style: titleStyle,
            cursorColor: kPrimaryColor,
            
            decoration: InputDecoration(
              suffixIcon: widget.isPassword
                        ? IconButton(
                            onPressed: () {
                              setState(() {
                                showPwd = !showPwd;
    icon = showPwd
        ? const Icon(Icons.visibility_off_outlined)
        : const Icon(Icons.visibility_outlined);
                              });
                            },
                            icon: icon,
                          )
                        : null,
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: kErrorColor,
                  style: BorderStyle.solid,
                  width: 2,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: kErrorColor,
                  style: BorderStyle.solid,
                  width: 2,
                ),
              ),
              hintText: widget.hint,
              hintStyle: subTitle,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Colors.grey,
                  style: BorderStyle.solid,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: kBrownColor,
                  width: 2,
                ),
              ),
              errorStyle: titleStyle.copyWith(
                color: kErrorColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
