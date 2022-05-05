import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:maintenance_repository/maintenance_repository.dart';

part 'work_order_event.dart';
part 'work_order_state.dart';

class WorkOrderBloc extends Bloc<WorkOrderEvent, WorkOrderState> {
  final MaintenanceRepository maintenanceRepository;
  WorkOrderBloc(this.maintenanceRepository) : super(WorkOrderInitial()) {
    on<EventWorkOrderLoad>(_onEventLoadWorkOrders);
    on<EventWorkOrderUpdated>(_onEventUpdatedWorkOrders);
    on<EventWorkOrderFilter>(_eventWorkOrderFilter);
  }

  Future<void> _onEventLoadWorkOrders(
      EventWorkOrderLoad event, Emitter<WorkOrderState> emit) async {
    await emit.onEach<List<WorkOrder>>(
      maintenanceRepository.loadWorkOrders(),
      onData: (workOrder) => add(EventWorkOrderUpdated(workOrder: workOrder)),
    );
  }

  Future<void> _eventWorkOrderFilter(
      EventWorkOrderFilter event, Emitter<WorkOrderState> emit) async {
    await emit.onEach<List<WorkOrder>>(
      maintenanceRepository.updatedWorkOrders(filter: event.filter),
      onData: (workOrder) => add(EventWorkOrderUpdated(workOrder: workOrder)),
    );
  }

  void _onEventUpdatedWorkOrders(
      EventWorkOrderUpdated event, Emitter<WorkOrderState> emit) {
    emit(StateWorkOrderLoaded(workOrders: event.workOrder));
  }
}
