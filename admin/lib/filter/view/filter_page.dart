import 'package:admin/app/app.dart';
import 'package:admin/filter/filter.dart';
import 'package:admin/work_order/bloc/work_order_bloc.dart';
import 'package:carrying_ui/carrying_ui.dart';
import 'package:flutter/material.dart';
import 'package:admin/filter/widgets/widgets.dart';
import 'package:maintenance_repository/maintenance_repository.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_widgets/my_widgets.dart';

class FilterPage extends StatelessWidget {
  static Page page() => const MaterialPage<void>(child: FilterPage());

  const FilterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CarryingColors.white,
      appBar: AppBar(
        elevation: 0.6,
        leading: InkWell(
          onTap: () {
            context.flow<String>().update((state) => PageState.authenticated);
          },
          child: const Icon(Icons.arrow_back_outlined,
              color: CarryingColors.black),
        ),
        title: Text(
          "Filter",
          style: Theme.of(context).textTheme.headline4,
        ),
        backgroundColor: CarryingColors.white,
      ),
      body: BlocBuilder<FilterBloc, FilterState>(
        builder: (context, state) {
          if (state is FilterLoaded) {
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  const ConditionRadioButton(),
                  const Divider(),
                  const SizedBox(height: 12),
                  DateRangePickerWidget(
                    dateRange: state.filter.dateTimeRanges,
                    dateTimeRange: (DateTimeRange? newValue) {
                      context.read<FilterBloc>().add(FilteredLoad(
                              filter: state.filter.copyWith(
                            dateTimeRanges: newValue,
                          )));
                    },
                  ),
                  const SizedBox(height: 12),
                  const Divider(),
                  const Expanded(
                    child: BranchesCheckedBoxList(),
                  ),
                  const Divider(),
                  CustomPrimaryButton(
                    onEvent: () {
                      context
                          .read<WorkOrderBloc>()
                          .add(EventWorkOrderFilter(filter: state.filter));
                      context
                          .flow<String>()
                          .update((state) => PageState.authenticated);
                    },
                    theme: Theme.of(context),
                    textValue: 'Filter',
                    buttonColor: CarryingColors.pink,
                    textColor: CarryingColors.white,
                  ),
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
