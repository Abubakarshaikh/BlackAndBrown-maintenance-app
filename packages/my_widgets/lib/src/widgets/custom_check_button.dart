import 'package:flutter/material.dart';


class CustomCheckbox extends StatelessWidget {
  final bool isChecked;
  final VoidCallback onEvent;
  const CustomCheckbox({required this.isChecked, required this.onEvent});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onEvent,
      child: Container(
        decoration: BoxDecoration(
          color: isChecked ? const Color(0xffFFD800) : Colors.transparent,
          borderRadius: BorderRadius.circular(4.0),
          border: isChecked ? null : Border.all(color: Color(0xff94959b), width: 1.5),
        ),
        width: 20,
        height: 20,
        child: isChecked
            ? const Icon(
                Icons.check,
                size: 20,
                color: Colors.white,
              )
            : null,
      ),
    );
  }
}
