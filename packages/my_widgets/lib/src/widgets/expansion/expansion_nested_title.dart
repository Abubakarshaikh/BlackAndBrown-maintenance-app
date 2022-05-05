import 'package:flutter/material.dart';

class ExpansionNestedTitle extends StatelessWidget {
  final String title;
  final TextStyle textStyle;
  final bool checkStatus;
  final Function(bool?) checkOnChange;
  final Widget expansionChip;
  const ExpansionNestedTitle({
    Key? key,
    required this.textStyle,
    required this.title,
    required this.checkStatus,
    required this.checkOnChange,
    required this.expansionChip,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          minVerticalPadding: 0,
          title: Text(
            title,
            style: textStyle.copyWith(
                decoration: checkStatus != true
                    ? TextDecoration.none
                    : TextDecoration.lineThrough),
          ),
          leading: Checkbox(
            fillColor: MaterialStateProperty.all(const Color(0xffFFD800)),
            checkColor: Colors.white,
            shape: const CircleBorder(),
            side: const BorderSide(
              color: Color(0xffFFD800),
              width: 1,
            ),
            value: checkStatus,
            onChanged: checkOnChange,
          ),
        ),
        expansionChip
      ],
    );
  }
}
