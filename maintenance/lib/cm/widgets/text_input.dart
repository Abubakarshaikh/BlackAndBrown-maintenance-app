import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  const TextInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.start,
      keyboardType: TextInputType.name,
      cursorColor: const Color(0xff1B1B1B),
      style: Theme.of(context).textTheme.bodyText1,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(bottom: 0),
        labelText: "Findings",
        labelStyle: Theme.of(context).textTheme.caption,
      ),
    );
  }
}
