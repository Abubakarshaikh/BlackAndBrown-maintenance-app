import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:maintenance_api/maintenance_api.dart';
import 'package:maintenance_repository/maintenance_repository.dart';
import 'package:meta/meta.dart';

part 'hcl_event.dart';
part 'hcl_state.dart';

class HclBloc extends Bloc<HclEvent, HclState> {
  final MaintenanceRepository maintenanceRepository;
  HclBloc(this.maintenanceRepository) : super(HclInitial()) {
    on<HclLoad>(_onEventStateLoaded);
    on<HclUpdate>(_onEventStateUpdated);
    on<HclTileUpdate>(_onEventStateTileUpdated);
    on<HclChipUpdate>(__onEventStateChipUpdated);
  }

  void _onEventStateLoaded(HclLoad event, Emitter<HclState> emit) async {
    try {
      final fromRepository =
          await maintenanceRepository.getCheckLists(dept: "hcl");
      emit(HclLoaded(checkLists: fromRepository));
    } catch (e) {
      throw Exception();
    }
  }

  void _onEventStateUpdated(HclUpdate event, Emitter<HclState> emit) {
    final state = this.state;
    try {
      if (state is HclLoaded) {
        final List<CheckLists> checkLists = state.checkLists.map((tile) {
          return event.checkLists.id == tile.id
              ? event.checkLists.copyWith(
                  status: event.checkLists.checkListNested
                      .every((element) => element.status == true))
              : tile;
        }).toList();
        emit(HclLoaded(checkLists: checkLists));
      }
    } catch (e) {
      throw Exception();
    }
  }

  void _onEventStateTileUpdated(HclTileUpdate event, Emitter<HclState> emit) {
    final state = this.state;
    try {
      if (state is HclLoaded) {
        final List<CheckLists> checkLists = state.checkLists.map((tile) {
          return tile.copyWith(
              checkListNested: tile.checkListNested.map((newValue) {
            return event.checkListNested.id != newValue.id
                ? newValue
                : event.checkListNested;
          }).toList());
        }).toList();

        emit(HclLoaded(checkLists: checkLists));
      }
    } catch (e) {
      throw Exception();
    }
  }

  void __onEventStateChipUpdated(HclChipUpdate event, Emitter<HclState> emit) {
    final state = this.state;
    try {
      if (state is HclLoaded) {
        final List<CheckLists> checkLists = state.checkLists.map((tile) {
          return tile.copyWith(
              checkListNested: tile.checkListNested.map((newTile) {
            return newTile.copyWith(
                selectChips: newTile.selectChips.map((chip) {
              return event.selectChip.id != chip.id ? chip : event.selectChip;
            }).toList());
          }).toList());
        }).toList();
        emit(HclLoaded(checkLists: checkLists));
      }
    } catch (e) {
      throw Exception();
    }
  }
}
