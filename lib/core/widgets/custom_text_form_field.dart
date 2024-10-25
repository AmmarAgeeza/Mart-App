import 'package:flutter/material.dart';
import 'package:mart_app/core/utils/app_styles.dart';

import '../utils/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType type;
  final void Function(String?)? onSave;
  final Function(String)? onChange;
  final Function()? onTap;
  final bool isPassword;
  final String? Function(String?)? validate;
  final String? label;
  final String? hint;
  final IconData? prefix;
  final IconData? suffix;
  final Function()? suffixPressed;
  final bool isClickable = true;
  final bool readOnly;
  final int maxLines;
  final Color? color;
  final bool filled;
  final Color? fillColor;
  final Color? textColor;
  final Color? hintColor;
  final EdgeInsetsGeometry? edgeInsetsGeometry;
  const CustomTextFormField(
      {super.key,
      required this.controller,
      required this.type,
      this.onSave,
      this.onChange,
      this.onTap,
      this.validate,
      this.hint,
      this.label,
      this.prefix,
      this.suffix,
      this.readOnly = false,
      this.suffixPressed,
      this.isPassword = false,
      this.maxLines = 1,
      this.edgeInsetsGeometry,
      this.textColor,
      this.hintColor = AppColors.grey,
      this.color,
      this.filled = false,
      this.fillColor});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      maxLines: maxLines,
      cursorColor: AppColors.black,
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onSaved: onSave,
      onChanged: onChange,
      onFieldSubmitted: onSave,
      onTap: onTap,
      validator: validate,
      readOnly: readOnly,
      style: AppStyles.mediumBlack16,
      decoration: InputDecoration(
        fillColor: fillColor,
        filled: filled,
        prefixIconColor: AppColors.black,
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: color != null ? color! : AppColors.grey),
          borderRadius: const BorderRadius.all(
            Radius.circular(
              14,
            ),
          ),
        ),
        contentPadding: edgeInsetsGeometry,
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.orange),
          borderRadius: BorderRadius.all(
            Radius.circular(
              14,
            ),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: color != null ? color! : AppColors.grey),
          borderRadius: const BorderRadius.all(
            Radius.circular(
              14,
            ),
          ),
        ),
        border: OutlineInputBorder(
          borderSide:
              BorderSide(color: color != null ? color! : AppColors.grey),
          borderRadius: const BorderRadius.all(
            Radius.circular(
              14,
            ),
          ),
        ),
        hintStyle: AppStyles.mediumBlack16.copyWith(color: hintColor),
        hintText: hint,
        prefixIcon: prefix != null
            ? Icon(
                prefix,
                color: textColor ?? AppColors.softGrey,
              )
            : null,
        suffixIcon: suffix != null
            ? GestureDetector(
                onTap: suffixPressed,
                child: Icon(
                  suffix,
                  color: textColor ?? AppColors.orange,
                  size: 24,
                ),
              )
            : null,
      ),
    );
  }
}
