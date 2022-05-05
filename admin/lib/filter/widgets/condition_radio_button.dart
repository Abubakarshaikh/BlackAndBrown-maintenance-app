import 'package:admin/filter/bloc/filter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carrying_ui/carrying_ui.dart';

class ConditionRadioButton extends StatelessWidget {
  const ConditionRadioButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBloc, FilterState>(
      builder: (context, state) {
        if (state is FilterLoaded) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Radio(
                fillColor: MaterialStateProperty.all(CarryingColors.pink),
                groupValue: state.filter.workType,
                value: "All",
                onChanged: (String? newValue) {
                  context.read<FilterBloc>().add(FilteredLoad(
                      filter: state.filter.copyWith(workType: newValue)));
                },
              ),
              Text("All", style: Theme.of(context).textTheme.bodyText1),
              Radio(
                fillColor: MaterialStateProperty.all(CarryingColors.pink),
                groupValue: state.filter.workType,
                value: "Corrective",
                onChanged: (String? newValue) {
                  context.read<FilterBloc>().add(FilteredLoad(
                      filter: state.filter.copyWith(workType: newValue)));
                },
              ),
              Text("Corrective", style: Theme.of(context).textTheme.bodyText1),
              Radio(
                fillColor: MaterialStateProperty.all(CarryingColors.pink),
                groupValue: state.filter.workType,
                value: "Preventive",
                onChanged: (String? newValue) {
                  context.read<FilterBloc>().add(FilteredLoad(
                      filter: state.filter.copyWith(workType: newValue)));
                },
              ),
              Text("Preventive", style: Theme.of(context).textTheme.bodyText1),
            ],
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
