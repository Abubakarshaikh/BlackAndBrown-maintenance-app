part of 'hcl_bloc.dart';


abstract class HclState extends Equatable {
  const HclState();
  @override
  List<Object?> get props => [];
}

class HclInitial extends HclState {}

class HclLoaded extends HclState {
  final List<CheckLists> checkLists;
  const HclLoaded({required this.checkLists});

  @override
  List<Object?> get props => [checkLists];
}