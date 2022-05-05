part of 'work_order_details_bloc.dart';

@immutable
abstract class WorkOrderDetailsState extends Equatable {
  const WorkOrderDetailsState();

  @override
  List<Object?> get props => [];
}

class WorkOrderDetailsInitial extends WorkOrderDetailsState {}

class LoadedWorkOrderDetails extends WorkOrderDetailsState {
  final WorkOrder workOrder;
  const LoadedWorkOrderDetails({required this.workOrder});

  @override
  List<Object?> get props => [workOrder];
}
