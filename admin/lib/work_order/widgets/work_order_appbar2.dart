import 'package:admin/app/models/app_state.dart';
import 'package:maintenance_repository/maintenance_repository.dart';

import 'package:carrying_ui/carrying_ui.dart';
import 'package:flutter/material.dart';
import 'package:flow_builder/flow_builder.dart';

class WorkOrderAppBar2 extends StatelessWidget {
  final List<WorkOrder> workOrders;
  const WorkOrderAppBar2({
    Key? key,
    required this.workOrders,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        color: CarryingColors.white,
        height: 64,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundColor: const Color(0xffdfe2e7).withOpacity(0.5),
              child: InkWell(
                  onTap: () {
                    context.flow<String>().update((state) => PageState.filtered);
                  },
                  child: const Icon(Icons.filter_list,
                      color: CarryingColors.black)),
            ),
            Text('${workOrders.length} results',
                style: theme.textTheme.bodyText1!.copyWith(
                  color: const Color(0xff606162),
                  fontSize: 16,
                ))
          ],
        ),
      ),
    );
  }
}
