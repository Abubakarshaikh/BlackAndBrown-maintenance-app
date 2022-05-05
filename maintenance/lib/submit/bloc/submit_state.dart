part of 'submit_bloc.dart';

@immutable
abstract class SubmitState extends Equatable {
  const SubmitState();

  @override
  List<Object?> get props => [];
}

class SubmitInitial extends SubmitState {}

class SubmitUserInfo extends SubmitState {
  final HomeModel homeModel;

  const SubmitUserInfo({required this.homeModel});
  @override
  List<Object?> get props => [homeModel];
}

class SubmitCmLoaded extends SubmitState {
  final Cm cmState;
  const SubmitCmLoaded({required this.cmState});

  @override
  List<Object?> get props => [cmState];
}

class SubmitPmLoaded extends SubmitState {
  final WorkOrder workOrder;
  const SubmitPmLoaded({required this.workOrder});

  @override
  List<Object?> get props => [workOrder];
}

class SubmitHclLoaded extends SubmitState {
  final Hcl hclState;
  const SubmitHclLoaded({required this.hclState});

  @override
  List<Object?> get props => [hclState];
}
