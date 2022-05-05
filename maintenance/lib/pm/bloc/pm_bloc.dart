import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:maintenance_api/maintenance_api.dart';
import 'package:maintenance_repository/maintenance_repository.dart';
import 'package:meta/meta.dart';

part 'pm_event.dart';
part 'pm_state.dart';

class PmBloc extends Bloc<PmEvent, PmState> {
  final MaintenanceRepository maintenanceRepository;
  PmBloc(this.maintenanceRepository) : super(PmInitial()) {
    on<PmLoad>(_onEventStateLoaded);
    on<PmUpdate>(_onEventStateUpdated);
    on<PmTileUpdate>(_onEventStateTileUpdated);
    // on<PmChipUpdate>(__onEventStateChipUpdated);
  }

  void _onEventStateLoaded(PmLoad event, Emitter<PmState> emit) async {
    try {
      final fromRepository =
          await maintenanceRepository.getCheckLists(dept: "pm");
      emit(PmLoaded(checkLists: fromRepository));
    } catch (e) {
      throw Exception();
    }
  }

  void _onEventStateUpdated(PmUpdate event, Emitter<PmState> emit) {
    final state = this.state;
    try {
      if (state is PmLoaded) {
        final List<CheckLists> checkLists = state.checkLists.map((tile) {
          return event.checkLists.id == tile.id
              ? event.checkLists.copyWith(
                  status: event.checkLists.checkListNested
                      .every((element) => element.status == true))
              : tile;
        }).toList();
        emit(PmLoaded(checkLists: checkLists));
      }
    } catch (e) {
      throw Exception();
    }
  }

  void _onEventStateTileUpdated(PmTileUpdate event, Emitter<PmState> emit) {
    final state = this.state;
    try {
      if (state is PmLoaded) {
        final List<CheckLists> checkLists = state.checkLists.map((tile) {
          return tile.copyWith(
              checkListNested: tile.checkListNested.map((newValue) {
            return event.checkListNested.id != newValue.id
                ? newValue
                : event.checkListNested;
          }).toList());
        }).toList();

        emit(PmLoaded(checkLists: checkLists));
      }
    } catch (e) {
      throw Exception();
    }
  }

  // void __onEventStateChipUpdated(PmChipUpdate event, Emitter<PmState> emit) {
  //   final state = this.state;
  //   try {
  //     if (state is PmLoaded) {
  //       final List<CheckLists> checkLists = state.checkLists.map((tile) {
  //         return tile.copyWith(
  //             checkListNested: tile.checkListNested.map((newTile) {
  //           return newTile.copyWith(
  //               selectChips: newTile.selectChips.map((chip) {
  //             return event.selectChip.id != chip.id ? chip : event.selectChip;
  //           }).toList());
  //         }).toList());
  //       }).toList();
  //       emit(PmLoaded(checkLists: checkLists));
  //     }
  //   } catch (e) {
  //     throw Exception();
  //   }
  // }
}
