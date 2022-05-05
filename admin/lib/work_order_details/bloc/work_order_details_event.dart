part of 'work_order_details_bloc.dart';

@immutable
abstract class WorkOrderDetailsEvent extends Equatable {
  const WorkOrderDetailsEvent();

  @override
  List<Object?> get props => [];
}

class LoadWorkOrderDetails extends WorkOrderDetailsEvent {
  final WorkOrder workOrder;
  const LoadWorkOrderDetails({required this.workOrder});

  @override
  List<Object?> get props => [workOrder];
}
