import 'package:flutter/material.dart';

class ExpansionTiles extends StatelessWidget {
  final Function(int index, bool isExpanded) expansionCallback;
  final List<ExpansionPanelRadio> expansionPanelRadio;
  const ExpansionTiles({
    Key? key,
    required this.expansionCallback,
    required this.expansionPanelRadio,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ExpansionPanelList.radio(
       dividerColor: Colors.blueGrey.withOpacity(
         0.1
       ),
        elevation: 1,
        expansionCallback: expansionCallback,
        children: expansionPanelRadio,
      ),
    );
  }
}
