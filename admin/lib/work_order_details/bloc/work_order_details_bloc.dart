import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:maintenance_repository/maintenance_repository.dart';
import 'package:meta/meta.dart';

part 'work_order_details_event.dart';
part 'work_order_details_state.dart';

class WorkOrderDetailsBloc
    extends Bloc<WorkOrderDetailsEvent, WorkOrderDetailsState> {
  WorkOrderDetailsBloc() : super(WorkOrderDetailsInitial()) {
    on<LoadWorkOrderDetails>(_loadWorkOrderDetails);
  }

  void _loadWorkOrderDetails(
      LoadWorkOrderDetails event, Emitter<WorkOrderDetailsState> emit) {
    emit(LoadedWorkOrderDetails(workOrder: event.workOrder));
  }
}
