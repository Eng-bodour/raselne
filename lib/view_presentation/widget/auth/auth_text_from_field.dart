import 'package:flutter/material.dart';
import 'package:raselne/utilis/theme.dart';

class AuthTextFromField extends StatelessWidget {
  final TextEditingController? controller;
  final bool obscureText;
  final Function validator;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final String hintText;
  final dynamic keyboardType;
  final bool read;
  // TextDirection? textdirehint;

  const AuthTextFromField({
     this.controller,
    required this.obscureText,
    required this.validator,
    required this.prefixIcon,
    required this.suffixIcon,
    required this.hintText,
    required this.keyboardType,
    required this.read,
    // this.textdirehint,
    // this.label,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      cursorColor: Colors.black,
      keyboardType: keyboardType,
      validator: (value) => validator(value),
      style: const TextStyle(
        color: Colors.black,
      ),
      readOnly: read,
      decoration: InputDecoration(
        // hintTextDirection: textdirehint,
        alignLabelWithHint: true,
        //  labelText: label,
        //  labelStyle: const TextStyle(color: mainColor, fontSize: f20),
        fillColor: Colors.grey.shade200,

        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.black45,
          fontSize: f16,
          fontWeight: FontWeight.w500,
        ),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
