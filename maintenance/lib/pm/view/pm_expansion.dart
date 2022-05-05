import 'package:flutter/material.dart';
import 'package:maintenance/pm/bloc/pm_bloc.dart';
import 'package:my_widgets/my_widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maintenance_repository/maintenance_repository.dart';

class PmExpansion extends StatelessWidget {
  final List<CheckLists> checkLists;
  const PmExpansion({
    Key? key,
    required this.checkLists,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return ExpansionTiles(
      expansionCallback: (index, isExpanded) {
        final tile = checkLists[index];
        context
            .read<PmBloc>()
            .add(PmUpdate(checkLists: tile.copyWith(isExpanded: isExpanded)));
      },
      expansionPanelRadio: checkLists.map((checkLists) {
        return ExpansionPanelRadio(
          value: checkLists.title,
          headerBuilder: (context, isExpanded) {
            return ExpansionTitle(
              textStyle: theme.textTheme.headline3!,
              checkStatus: checkLists.status,
              checkOnChange: (newValue) {},
              title: checkLists.title,
            );
          },
          body: Column(
            children: checkLists.checkListNested.map((checkListsNested) {
              return ExpansionNestedTitle(
                checkStatus: checkListsNested.status,
                checkOnChange: (newValue) {},
                textStyle: theme.textTheme.bodyText2!,
                title: checkListsNested.title,
                expansionChip: ExpansionChip(
                  children: checkListsNested.selectChips.map((chip) {
                    return ExpansionChips(
                      onLongPress: (String? newValue) {
                        context.read<PmBloc>().add(
                              PmUpdate(
                                checkLists: checkLists.copyWith(
                                    checkListNested:
                                        checkLists.checkListNested.map((e) {
                                  return e.id != checkListsNested.id
                                      ? e
                                      : checkListsNested.copyWith(
                                          title: e.title,
                                          status: newValue!.isNotEmpty
                                              ? true
                                              : e.status,
                                          selectChips: checkListsNested
                                              .selectChips
                                              .map((e) {
                                            return chip.id == e.id &&
                                                    newValue.isNotEmpty
                                                ? e.copyWith(
                                                    title: newValue,
                                                    status: true)
                                                : e.copyWith(
                                                    title: e.title,
                                                    status: false);
                                          }).toList());
                                }).toList()),
                              ),
                            );
                      },
                      themeData: theme,
                      chipStatus: chip.status,
                      title: chip.title,
                      chipOnchange: (newValue) {
                        context.read<PmBloc>().add(
                              PmUpdate(
                                checkLists: checkLists.copyWith(
                                    checkListNested:
                                        checkLists.checkListNested.map((e) {
                                  return e.id != checkListsNested.id
                                      ? e
                                      : checkListsNested.copyWith(
                                          status: newValue,
                                          selectChips: checkListsNested
                                              .selectChips
                                              .map((e) {
                                            return chip.id == e.id
                                                ? e.copyWith(status: newValue)
                                                : e.copyWith(status: false);
                                          }).toList());
                                }).toList()),
                              ),
                            );
                      },
                    );
                  }).toList(),
                ),
              );
            }).toList(),
          ),
        );
      }).toList(),
    );
  }
}
