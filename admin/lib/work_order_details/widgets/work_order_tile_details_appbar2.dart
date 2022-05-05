import 'package:flutter/material.dart';

class WorkOrderTileDetailsAppBar2 extends StatelessWidget {
  final String title;
  final String time;
  const WorkOrderTileDetailsAppBar2({
    Key? key,
    required this.title,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.5),
            child: Text(title, style: theme.headline4!.copyWith(fontSize: 24)),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.5),
            child: Text(
              time,
              style: theme.caption!.copyWith(color: Colors.red),
            ),
          ),
          const SizedBox(height: 36),
          const Divider(),
        ],
      ),
    );
  }
}
