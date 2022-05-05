import 'package:flutter/material.dart';

class ExpansionTitle extends StatelessWidget {
  final bool checkStatus;
  final Function(bool?) checkOnChange;
  final String title;
  final TextStyle textStyle;
  const ExpansionTitle({
    Key? key,
    required this.checkStatus,
    required this.checkOnChange,
    required this.title,
    required this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: Checkbox(
          side: const BorderSide(
            color: Color(0xffFFD800),
            width: 1,
          ),
          shape: const CircleBorder(),
          fillColor: MaterialStateProperty.all(const Color(0xffFFD800)),
          checkColor: Colors.white,
          value: checkStatus,
          onChanged: checkOnChange),
      title: Text(
        title,
        style: textStyle.copyWith(
            decoration: checkStatus != true
                ? TextDecoration.none
                : TextDecoration.lineThrough),
      ),
    );
  }
}
