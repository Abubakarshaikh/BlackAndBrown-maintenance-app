import 'package:flutter/material.dart';

class DropDownBtn extends StatelessWidget {
  final ThemeData theme;
  final String title;
  final Function(String?) onChange;
  final String selectedValue;
  final List<String> items;
  final Color hintTextColor;
  const DropDownBtn({
    Key? key,
    required this.title,
    this.hintTextColor = const Color(0xff1B1B1B),
    required this.onChange,
    required this.selectedValue,
    required this.items,
    required this.theme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      isExpanded: true,
      style: theme.textTheme.bodyText1,
      value: selectedValue == title ? null : selectedValue,
      onChanged: onChange,
      hint: Text(title,
          style: theme.textTheme.bodyText1!.copyWith(color: hintTextColor)),
      items: items.map((newValue) {
        return DropdownMenuItem(
          child: Text(newValue),
          value: newValue,
        );
      }).toList(),
    );
  }
}
