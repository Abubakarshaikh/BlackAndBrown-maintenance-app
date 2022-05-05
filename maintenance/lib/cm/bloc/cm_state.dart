part of 'cm_bloc.dart';

@immutable
abstract class CmState extends Equatable {
  const CmState();
  @override
  List<Object?> get props => [];
}

class CmInitial extends CmState {}

class CmLoaded extends CmState {
  final Cm cm;

  const CmLoaded({required this.cm});
  @override
  List<Object?> get props => [cm];
}
