import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool? obscureText;
  final Function(String) onChange;
  final TextTheme textTheme;
  final int? maxLines;
  final TextInputType? textInputType;
  final bool readOnly;
  const CustomTextField({
    required this.textTheme,
    required this.hintText,
    required this.onChange,
    this.obscureText,
    this.maxLines,
    this.textInputType,
    this.readOnly = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xfff1f1f5),
        borderRadius: BorderRadius.circular(14.0),
      ),
      child: TextFormField(
        readOnly: readOnly,
        keyboardType: textInputType ?? TextInputType.text,
        obscureText: obscureText ?? false,
        style: textTheme.bodyText1,
        maxLines: maxLines ?? 1,
        onChanged: onChange,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: textTheme.overline,
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
