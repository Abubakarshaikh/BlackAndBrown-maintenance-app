import 'package:flutter/material.dart';

class SubmitBtn extends StatelessWidget {
  final ThemeData themeData;
  final String title;
  final VoidCallback onEvent;
  const SubmitBtn({
    Key? key,
    required this.title,
    required this.onEvent,
    required this.themeData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onEvent,
      child: Text(title, style: themeData.textTheme.button),
    );
  }
}
