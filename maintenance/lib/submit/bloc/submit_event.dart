part of 'submit_bloc.dart';

@immutable
abstract class SubmitEvent extends Equatable {
  const SubmitEvent();
  @override
  List<Object?> get props => [];
}

class SubmittedComplete extends SubmitEvent {
  final String desc;
  const SubmittedComplete({this.desc = ''});
  @override
  List<Object?> get props => [desc];
}

class SubmittedUserInfo extends SubmitEvent {
  final HomeModel homeModel;

  const SubmittedUserInfo({required this.homeModel});
  @override
  List<Object?> get props => [homeModel];
}

class CmSubmitted extends SubmitEvent {
  final Cm cm;
  const CmSubmitted({required this.cm});
  @override
  List<Object?> get props => [cm];
}

class PmSubmitted extends SubmitEvent {
  final WorkOrder workOrder;
  const PmSubmitted({required this.workOrder});
  @override
  List<Object?> get props => [workOrder];
}

class HclSubmitted extends SubmitEvent {
  final Hcl hcl;
  const HclSubmitted({required this.hcl});
  @override
  List<Object?> get props => [hcl];
}
