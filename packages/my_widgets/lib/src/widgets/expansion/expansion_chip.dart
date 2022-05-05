import 'package:flutter/material.dart';
import 'package:my_widgets/my_widgets.dart';

class ExpansionChip extends StatelessWidget {
  final List<Widget> children;

  const ExpansionChip({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: children,
      ),
    );
  }
}

class ExpansionChips extends StatelessWidget {
  final bool chipStatus;
  final String title;
  final Function(bool?) chipOnchange;
  final Function(String?) onLongPress;
  // final Function(String?) onChange;
  final ThemeData themeData;
  const ExpansionChips({
    Key? key,
    required this.title,
    required this.chipStatus,
    required this.chipOnchange,
    required this.onLongPress,
    required this.themeData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: GestureDetector(
        onLongPress: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return AddTextToChip(
                  title: title,
                  onChange: onLongPress,
                  themeData: themeData,
                );
              });
        },
        child: ChoiceChip(
          selected: chipStatus,
          selectedColor: const Color(0xffFFD800),
          onSelected: chipOnchange,
          label: Text(title,
              style: themeData.textTheme.bodyText2!.copyWith(fontSize: 14)),
        ),
      ),
    );
  }
}

// class AddChip extends StatelessWidget {
//   final String title;
//   final ThemeData themeData;
//   final Function(String?) onChange;
//   const AddChip({
//     Key? key,
//     required this.title,
//     required this.onChange,
//     required this.themeData,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return InputChip(
//       label: Text(title,
//           style: themeData.textTheme.bodyText2!.copyWith(fontSize: 14)),
//       onPressed: () {
//         showModalBottomSheet(
//             context: context,
//             builder: (context) {
//               return AddTextToChip(
//                 themeData: themeData,
//                 onChange: onChange,
//               );
//             });
//       },
//     );
//   }
// }

class AddTextToChip extends StatelessWidget {
  final String title;
  final ThemeData themeData;
  final Function(String?) onChange;
  const AddTextToChip({
    Key? key,
    required this.title,
    required this.onChange,
    required this.themeData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String value = '';
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: TextEditingController()..text = title,
              onChanged: onChange,
              style: themeData.textTheme.bodyText2!.copyWith(fontSize: 20),
              keyboardType: TextInputType.text,
              autofocus: true,
              textAlign: TextAlign.center,
              
              decoration: const InputDecoration(),
            ),
            SubmitBtn(
              themeData: themeData,
              title: 'Add',
              onEvent: () => Navigator.pop(context),
            )
          ],
        ),
      ),
    );
  }
}
