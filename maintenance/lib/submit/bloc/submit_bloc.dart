import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
// import 'package:maintenance_repository/maintenance_repository.dart';
import 'package:meta/meta.dart';
import 'package:maintenance_repository/maintenance_repository.dart';
part 'submit_event.dart';
part 'submit_state.dart';

class SubmitBloc extends Bloc<SubmitEvent, SubmitState> {
  final MaintenanceRepository maintenanceRepository;
  SubmitBloc(this.maintenanceRepository) : super(SubmitInitial()) {
    on<SubmittedComplete>(_onSubmittedComplete);
    on<SubmittedUserInfo>(_onSubmitUserInfo);
    on<CmSubmitted>(_onCmSubmitted);
    on<PmSubmitted>(_onPmSubmitted);
    on<HclSubmitted>(_onHclSubmitted);
  }

  void _onSubmitUserInfo(SubmittedUserInfo event, Emitter<SubmitState> emit) {
    emit(SubmitUserInfo(homeModel: event.homeModel));
  }

  Future<void> _onSubmittedComplete(
      SubmittedComplete event, Emitter<SubmitState> emit) async {
    final state = this.state;
    if (state is SubmitCmLoaded) {
      await maintenanceRepository.addCm(
          cm: state.cmState.copyWith(desc: event.desc));

      await maintenanceRepository.addWorkOrder(
        workOrder: WorkOrder(
          branch: state.cmState.branch,
          department: state.cmState.department,
          desc: event.desc,
          email: state.cmState.email,
          endingCoordinates: state.cmState.initialCoordinate,
          endingTime: state.cmState.endingTime,
          fullName: state.cmState.fullName,
          id: state.cmState.id,
          initialCoordinate: state.cmState.initialCoordinate,
          phoneNumber: state.cmState.phoneNumber,
          startingTime: state.cmState.startingTime,
          title: state.cmState.findings,
          workType: "Corrective",
          works: [
            Work(
              title: "Complainer Name",
              status: [state.cmState.complainerName],
            ),
            Work(
              title: "Findings",
              status: [state.cmState.findings],
            ),
            Work(
              title: "Material Requirement",
              status: [state.cmState.materialRequirement],
            ),
          ],
        ),
      );
    } else if (state is SubmitPmLoaded) {
      await maintenanceRepository.addPm(
          workOrder: state.workOrder.copyWith(desc: event.desc));
    } else if (state is SubmitHclLoaded) {
      await maintenanceRepository.addHcl(
          hcl: state.hclState.copyWith(desc: event.desc));
    }
  }

  void _onCmSubmitted(CmSubmitted event, Emitter<SubmitState> emit) {
    final state = this.state;
    if (state is SubmitUserInfo) {
      emit(SubmitCmLoaded(
          cmState: event.cm.copyWith(
        email: state.homeModel.email,
        fullName: state.homeModel.fullName,
        id: state.homeModel.id,
        phoneNumber: state.homeModel.phoneNumber,
        startingTime: state.homeModel.initialTime,
        branch: state.homeModel.selectedBranch,
        department: state.homeModel.selectedDepartment,
        initialCoordinate: state.homeModel.initialCoordinate,
      )));
    }
  }

  void _onPmSubmitted(PmSubmitted event, Emitter<SubmitState> emit) {
    final state = this.state;
    if (state is SubmitUserInfo) {
      emit(SubmitPmLoaded(
          workOrder: event.workOrder.copyWith(
        email: state.homeModel.email,
        fullName: state.homeModel.fullName,
        id: state.homeModel.id,
        // phoneNumber: state.homeModel.phoneNumber,
        // startingTime: state.homeModel.initialTime,
        branch: state.homeModel.selectedBranch,
        department: state.homeModel.selectedDepartment,
        // initialCoordinate: state.homeModel.initialCoordinate,
      )));
    }
  }

  void _onHclSubmitted(HclSubmitted event, Emitter<SubmitState> emit) {
    final state = this.state;
    // emit(SubmitHclLoaded(hclState: event.hcl));
    if (state is SubmitUserInfo) {
      emit(SubmitHclLoaded(
          hclState: event.hcl.copyWith(
        email: state.homeModel.email,
        fullName: state.homeModel.fullName,
        id: state.homeModel.id,
        // phoneNumber: state.homeModel.phoneNumber,
        // startingTime: state.homeModel.initialTime,
        branch: state.homeModel.selectedBranch,
        department: state.homeModel.selectedDepartment,
        // initialCoordinate: state.homeModel.initialCoordinate,
      )));
    }
  }
}
