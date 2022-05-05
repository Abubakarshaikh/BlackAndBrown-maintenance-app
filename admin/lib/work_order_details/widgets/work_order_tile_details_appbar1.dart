import 'package:admin/app/models/models.dart';
import 'package:carrying_ui/carrying_ui.dart';
import 'package:flutter/material.dart';
import 'package:flow_builder/flow_builder.dart';

class WorkOrderTileDetailsAppBar1 extends StatelessWidget {
  const WorkOrderTileDetailsAppBar1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: CarryingColors.white,
      pinned: true,
      elevation: 0.3,
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 8),
          child: Icon(Icons.more_vert_rounded),
        ),
      ],
      leading: InkWell(
        onTap: () {
          context.flow<String>().update((state) => PageState.authenticated);
        },
        child: const Icon(Icons.arrow_back_outlined),
      ),
    );
  }
}
