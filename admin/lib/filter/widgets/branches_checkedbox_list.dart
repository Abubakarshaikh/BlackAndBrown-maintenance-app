import 'package:admin/filter/bloc/filter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:maintenance_repository/maintenance_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carrying_ui/carrying_ui.dart';
class BranchesCheckedBoxList extends StatelessWidget {
  const BranchesCheckedBoxList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBloc, FilterState>(
      builder: (context, state) {
        if (state is FilterLoaded) {
          return ListView(
            children: state.filter.branches.map((Branch _branch) {
              return BranchCheckedBox(
                  branchName: _branch.branchName,
                  onEvent: (bool? newValue) {
                    context.read<FilterBloc>().add(FilteredLoad(
                            filter: state.filter.copyWith(
                                branches: state.filter.branches.map((branch) {
                          return _branch.id == branch.id
                              ? branch.copyWith(isChecked: newValue)
                              : branch;
                        }).toList())));
                  },
                  isChecked: _branch.isChecked);
            }).toList(),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class BranchCheckedBox extends StatelessWidget {
  final String branchName;
  final bool isChecked;
  final Function(bool?) onEvent;
  const BranchCheckedBox(
      {Key? key,
      required this.branchName,
      required this.onEvent,
      required this.isChecked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minVerticalPadding: 0,
      horizontalTitleGap: 1.5,
      contentPadding: const EdgeInsets.only(right: 16.0),
      title: Text(branchName, style: Theme.of(context).textTheme.bodyText1),
      trailing: Checkbox(
        checkColor: Colors.white,
        fillColor: MaterialStateProperty.all(CarryingColors.pink),
        side: const BorderSide(
          color: CarryingColors.pink,
          width: 1.5,
        ),
        value: isChecked,
        onChanged: onEvent,
      ),
    );
  }
}
