import 'package:admin/work_order_details/bloc/work_order_details_bloc.dart';
import 'package:admin/work_order_details/widgets/widgets.dart';
import 'package:carrying_ui/carrying_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
class WorkOrderDetailsPage extends StatelessWidget {
  static Page page() => const MaterialPage<void>(child: WorkOrderDetailsPage());
  const WorkOrderDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkOrderDetailsBloc, WorkOrderDetailsState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: CarryingColors.white,
          body: CustomScrollView(
            slivers: [
              const WorkOrderTileDetailsAppBar1(),
              const SliverToBoxAdapter(
                child: SizedBox(height: 12),
              ),
              WorkOrderTileDetailsAppBar2(
                title: state is LoadedWorkOrderDetails
                    ? state.workOrder.title
                    : 'Something Went Wrong',
                time: state is LoadedWorkOrderDetails
                    // ? state.workOrder.startingTime.toString()
                    ? DateFormat('yyyy-MM-dd – h:mm a').format(state.workOrder.startingTime)
                    : 'Something Went Wrong',
              ),
              SliverToBoxAdapter(
                child: WorkOrderTileDetailsTile(
                  title: "Description",
                  statuses: [
                    state is LoadedWorkOrderDetails
                        ? state.workOrder.desc
                        : 'Something Went Wrong'
                  ],
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return WorkOrderTileDetailsTile(
                      title: state is LoadedWorkOrderDetails
                          ? state.workOrder.works[index].title
                          : 'Something Went Wrong',
                      statuses: state is LoadedWorkOrderDetails
                          ? state.workOrder.works[index].status
                          : ['Something Went Wrong'],
                    );
                  },
                  childCount: state is LoadedWorkOrderDetails
                      ? state.workOrder.works.length
                      : 0,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
