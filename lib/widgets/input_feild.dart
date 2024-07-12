import 'package:chitchat/constants/consts.dart';
import 'package:chitchat/cubits/register_cubits/register_cubit.dart';
import 'package:chitchat/cubits/register_cubits/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = RegisterCubit.get(context);
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
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextFormField(
                  validator: (data) {
                    if (data!.isEmpty) {
                      return "**Field Is Required!";
                    }
                    return null;
                  },
                  obscureText: isPassword && !cubit.showPwd,
                  controller: controller,
                  keyboardType: textType,
                  autofocus: false,
                  style: titleStyle,
                  cursorColor: kPrimaryColor,
                  decoration: InputDecoration(
                    suffixIcon: isPassword
                        ? IconButton(
                            onPressed: () {
                              cubit.changePasswordVisibility();
                            },
                            icon: cubit.icon,
                          )
                        : widget,
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
                    hintText: hint,
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
        },
      ),
    );
  }
}
