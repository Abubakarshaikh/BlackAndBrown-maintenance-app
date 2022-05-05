part of 'filter_bloc.dart';

@immutable
abstract class FilterState extends Equatable {
  const FilterState();

  @override
  List<Object?> get props => [];
}
class FilterLoaded extends FilterState {
  final Filter filter;
  const FilterLoaded({required this.filter});
  @override
  List<Object?> get props => [filter];
}

class FilterError extends FilterState {}
