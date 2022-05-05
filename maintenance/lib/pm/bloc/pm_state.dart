part of 'pm_bloc.dart';

@immutable
abstract class PmState extends Equatable {
  const PmState();
  @override
  List<Object?> get props => [];
}

class PmInitial extends PmState {}

class PmLoaded extends PmState {
  final List<CheckLists> checkLists;
  const PmLoaded({required this.checkLists});

  @override
  List<Object?> get props => [checkLists];
}