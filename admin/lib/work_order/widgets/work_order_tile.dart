import 'package:maintenance_repository/maintenance_repository.dart';
import 'package:intl/intl.dart';
import 'package:carrying_ui/carrying_ui.dart';
import 'package:flutter/material.dart';

class WorkOrderTile extends StatelessWidget {
  final VoidCallback onTap;
  final WorkOrder workOrder;
  const WorkOrderTile({Key? key, required this.workOrder, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          color: CarryingColors.white,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _tileChip(theme, workOrder.workType),
                const SizedBox(height: 8),
                Text(workOrder.title, style: theme.textTheme.bodyText2),
                const SizedBox(height: 8),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.access_time_sharp,
                      size: 16.5,
                      color: Color(0xffa9aaaa),
                    ),
                    const SizedBox(width: 8),
                    Text(DateFormat('yyyy-MM-dd – h:mm a').format(workOrder.startingTime),
                        style: theme.textTheme.caption!.copyWith(
                          color: Colors.red,
                        )),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      size: 17.0,
                      color: Color(0xffa9aaaa),
                    ),
                    const SizedBox(width: 8),
                    Text(workOrder.branch,
                        style: theme.textTheme.caption!.copyWith(
                          color: const Color(0xff606162),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _tileChip(ThemeData theme, String title) {
    return Card(
      elevation: 0,
      color: const Color(0xff767676),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Text(title,
            style: theme.textTheme.bodyText2!.copyWith(
              color: CarryingColors.white,
            )),
      ),
    );
  }
}
