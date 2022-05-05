import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:maintenance_repository/maintenance_repository.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final MaintenanceRepository maintenanceRepository;
  HomeBloc(this.maintenanceRepository) : super(HomeInitial()) {
    on<HomeLoad>(_onLoad);
    on<HomeUpdate>(_onUpdate);
  }

  void _onLoad(HomeLoad event, Emitter<HomeState> emit) async {
    emit(HomeInitial());
    try {
      final _loadHome = await maintenanceRepository.loadHomeModel();
      emit(HomeLoaded(home: _loadHome));
    } catch (e) {
      throw Exception();
    }
  }

  void _onUpdate(HomeUpdate event, Emitter<HomeState> emit) async {
    final state = this.state;
    try {
      if (state is HomeLoaded) {
        emit(HomeLoaded(home: event.homeUpdate));
      }
    } catch (e) {
      throw Exception();
    }
  }
}
