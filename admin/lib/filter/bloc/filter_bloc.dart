import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:maintenance_repository/maintenance_repository.dart';

part 'filter_event.dart';
part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc()
      : super(FilterLoaded(
            filter: Filter(
                workType: 'All',
                dateTimeRanges: null,
                branches: branchSample))) {
    on<FilteredLoad>(_eventLoad);
  }

  void _eventLoad(FilteredLoad event, Emitter<FilterState> emit) {
    emit(FilterLoaded(filter: event.filter));
  }
}
