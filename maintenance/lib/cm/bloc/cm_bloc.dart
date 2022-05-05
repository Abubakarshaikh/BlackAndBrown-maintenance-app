import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:maintenance_repository/maintenance_repository.dart';
import 'package:meta/meta.dart';

part 'cm_event.dart';
part 'cm_state.dart';

class CmBloc extends Bloc<CmEvent, CmState> {
  CmBloc() : super(CmInitial()) {
    on<CmLoad>(_onLoad);
    on<CMUpdated>(_onUpdated);
  }
  void _onLoad(CmLoad event, Emitter<CmState> emit) {
    emit(CmLoaded(
        cm: Cm(
      id: "id",
      email: "email",
      fullName: "fullName",
      phoneNumber: "phoneNumber",
      desc: " desc",
      initialCoordinate: "initialCoordinate",
      startingTime: DateTime.now(),
      endingTime: DateTime.now(),
      department: "department",
      branch: "branch",
      complainerName: "",
      findings: "",
      materialRequirement: "",
    )));
  }

  void _onUpdated(CMUpdated event, Emitter<CmState> emit) {
    final state = this.state;
    if (state is CmLoaded) {
      emit(CmLoaded(cm: event.cm));
    }
  }
}
