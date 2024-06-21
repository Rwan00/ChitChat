import 'package:chitchat/constants/consts.dart';
import 'package:flutter/material.dart';

import '../theme/fonts.dart';

class InputField extends StatelessWidget {
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
  Widget build(BuildContext context) {
    bool showPwd = false;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Text(
            title!,
            style: titleStyle,
          ),
        const SizedBox(
          height: 4,
        ),
        Container(
          height: 50,
          margin: const EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextFormField(
            obscureText: isPassword && !showPwd,
            controller: controller,
            keyboardType: textType,
            autofocus: false,
            style: titleStyle,
            cursorColor: primaryColor,
            decoration: InputDecoration(
              /* suffixIcon: isPassword
                        ? IconButton(
                            onPressed: () {
                              //cubit.changePasswordVisibility();
                            },
                            icon: cubit.icon,
                          )
                        : widget, */
              hintText: hint,
              hintStyle: subTitle,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                    style: BorderStyle.solid,
                    width: 1,
                  )),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  
                  borderSide: BorderSide(
                    color: brownColor,
                    width: 2,
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
