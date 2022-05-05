part of 'cm_bloc.dart';

@immutable
abstract class CmEvent extends Equatable {
  const CmEvent();
  @override
  List<Object?> get props => [];
}

class CmLoad extends CmEvent {}

class CMUpdated extends CmEvent {
  final Cm cm;
  const CMUpdated({required this.cm});

  @override
  List<Object?> get props => [cm];
}
