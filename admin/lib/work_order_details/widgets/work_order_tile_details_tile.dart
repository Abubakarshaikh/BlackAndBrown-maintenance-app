import 'package:flutter/material.dart';

class WorkOrderTileDetailsTile extends StatelessWidget {
  final String title;
  final List<String> statuses;
  const WorkOrderTileDetailsTile({
    Key? key,
    required this.title,
    required this.statuses,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(),
          const SizedBox(height: 12),
          Text(title, style: theme.bodyText1),
          const SizedBox(height: 12),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: statuses.map((status) {
              return Text(status,
                  style: theme.caption!.copyWith(fontWeight: FontWeight.w400));
            }).toList(),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
