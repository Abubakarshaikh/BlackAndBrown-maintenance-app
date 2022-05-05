part of 'hcl_bloc.dart';

abstract class HclEvent extends Equatable {
  const HclEvent();
  @override
  List<Object?> get props => [];
}

class HclLoad extends HclEvent {}

class HclUpdate extends HclEvent {
  final CheckLists checkLists;
  const HclUpdate({required this.checkLists});

  @override
  List<Object?> get props => [checkLists];
}

class HclTileUpdate extends HclEvent {
  final CheckListNested checkListNested;
  const HclTileUpdate({required this.checkListNested});

  @override
  List<Object?> get props => [checkListNested];
}

class HclChipUpdate extends HclEvent {
  final SelectChip selectChip;

  const HclChipUpdate({required this.selectChip});

  @override
  List<Object?> get props => [selectChip];
}
