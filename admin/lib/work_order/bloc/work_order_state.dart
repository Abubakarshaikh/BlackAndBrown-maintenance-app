part of 'work_order_bloc.dart';

abstract class WorkOrderState extends Equatable {
  const WorkOrderState();

  @override
  List<Object> get props => [];
}

class WorkOrderInitial extends WorkOrderState {}

class StateWorkOrderLoaded extends WorkOrderState {
  final List<WorkOrder> workOrders;

  const StateWorkOrderLoaded({required this.workOrders});

  @override
  List<Object> get props => [workOrders];
}
