part of 'filter_bloc.dart';

@immutable
abstract class FilterEvent extends Equatable {
  const FilterEvent();
  @override
  List<Object?> get props => [];
}

class FilteredLoad extends FilterEvent {
  final Filter filter;
  const FilteredLoad({required this.filter});

  @override
  List<Object?> get props => [filter];
}
