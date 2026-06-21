import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/color_theme.dart';
import '../../theme/font_theme.dart';

// ignore: must_be_immutable
class GlobalWidgetTextfield extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final EdgeInsetsGeometry? padding;
  final int? maxLength;
  final void Function(String value)? onChanged;
  final bool? isPassword;

  GlobalWidgetTextfield({super.key, required this.title, required this.controller, this.padding, this.maxLength, this.onChanged, this.isPassword});

  RxBool isObscured = true.obs;

  Widget buildTitle() => Padding(
    padding: EdgeInsets.only(bottom: 8),
    child: Text(
      title,
      style: FontThemes.titleSmall(),
    ),
  );

  Widget buildField() => Obx(()=> TextFormField(
    obscureText: (isPassword.obs.value == true)
      ? isObscured.value
      : false,
    controller: controller,
    maxLength: maxLength,
    style: FontThemes.bodyMedium(),
    onChanged: onChanged,
    decoration: InputDecoration(
      hintText: "Mohon isi",
      hintStyle: FontThemes.bodySmall(),
      fillColor: ColorsTheme.primary,
      filled: true,
      contentPadding: EdgeInsets.only(left: 15),
      suffixIcon: (isPassword == true)
        ? GestureDetector(
          onTap: (){
            isObscured.value = !isObscured.value;
          },
          child: Icon(
            (isObscured.value == true)
              ? Icons.visibility_off
              : Icons.visibility,
            color: (isObscured.value == true)
              ? ColorsTheme.textSecondary
              : ColorsTheme.white,
            size: 18,
          ),
        )
        : null,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: ColorsTheme.yellow
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorsTheme.yellow
        ),
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  ));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTitle(),
          buildField(),
        ],
      ),
    );
  }
}