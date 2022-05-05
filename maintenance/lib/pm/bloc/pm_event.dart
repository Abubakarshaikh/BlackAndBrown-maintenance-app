part of 'pm_bloc.dart';

@immutable
abstract class PmEvent extends Equatable {
  const PmEvent();
  @override
  List<Object?> get props => [];
}

class PmLoad extends PmEvent {}

class PmUpdate extends PmEvent {
  final CheckLists checkLists;
  const PmUpdate({required this.checkLists});

  @override
  List<Object?> get props => [checkLists];
}

class PmTileUpdate extends PmEvent {
  final CheckListNested checkListNested;
  const PmTileUpdate({required this.checkListNested});

  @override
  List<Object?> get props => [checkListNested];
}

class PmChipUpdate extends PmEvent {
  final SelectChip selectChip;

  const PmChipUpdate({required this.selectChip});

  @override
  List<Object?> get props => [selectChip];
}