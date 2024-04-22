// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? initialValue;
  final TextEditingController? controller;
  final bool obscureText;
  final bool readOnly;
  final void Function(String?)? onChanged;
  final void Function()? onEditingComplete;
  final void Function(String?)? onSaved;
  final int? maxLength;
  final int? maxLines;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final void Function()? onTap;
  final Widget? widget;
  final IconData? icon;
  final Widget? child;
  final int? minLines;

  MyTextField({
    Key? key,
    this.label,
    this.minLines,
    this.hint,
    this.initialValue,
    this.controller,
    this.obscureText = false,
    this.readOnly = false,
    this.onChanged,
    this.onEditingComplete,
    this.onSaved,
    this.maxLength,
    this.maxLines = 1,
    this.validator,
    this.keyboardType,
    this.textInputAction,
    this.prefixIcon,
    this.suffixIcon,
    this.onTap,
    this.widget,
    this.icon,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0),
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: label,
          hintText: hint,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
        ),
        minLines: minLines,
        initialValue: initialValue,
        // keyboardAppearance: TextInputType.datetime,
        onChanged: onChanged,
        onEditingComplete: onEditingComplete,
        onSaved: onSaved,
        maxLength: maxLength,
        maxLines: maxLines,
        readOnly: readOnly,
        obscureText: obscureText,
        inputFormatters: [],
        // inputFormatters: [
        //   // TextInputFormatter.withFunction((oldValue, newValue) => null)
        // ],
        controller: controller,
        validator: validator,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        onTap: () {
          onTap;
        },
      ),
    );
  }
}
