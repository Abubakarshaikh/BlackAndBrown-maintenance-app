part of 'work_order_bloc.dart';

abstract class WorkOrderEvent extends Equatable {
  const WorkOrderEvent();

  @override
  List<Object> get props => [];
}

class EventWorkOrderLoad extends WorkOrderEvent {}

class EventWorkOrderUpdated extends WorkOrderEvent {
  final List<WorkOrder> workOrder;

  const EventWorkOrderUpdated({required this.workOrder});
  @override
  List<Object> get props => [workOrder];
}

class EventWorkOrderFilter extends WorkOrderEvent {
  final Filter filter;
  const EventWorkOrderFilter({required this.filter});

  @override
  List<Object> get props => [filter];
}
