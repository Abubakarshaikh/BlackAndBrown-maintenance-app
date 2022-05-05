import 'package:carrying_ui/carrying_ui.dart';
import 'package:flutter/material.dart';

class WorkOrderAppBar1 extends StatelessWidget {
  final VoidCallback onEvent;
  const WorkOrderAppBar1({
    Key? key,
    required this.onEvent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SliverAppBar(
      elevation: 0,
      backgroundColor: CarryingColors.white,
      title: Text(
        'Work Orders',
        style: theme.textTheme.headline6!
            .copyWith(fontSize: 22, fontWeight: FontWeight.w400),
      ),
      pinned: true,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: InkWell(
            onTap: onEvent,
            child: const Icon(
              Icons.download,
              color: CarryingColors.black,
            ),
          ),
        )
      ],
    );
  }
}
