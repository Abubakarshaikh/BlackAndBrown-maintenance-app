part of 'home_bloc.dart';

@immutable
abstract class HomeState extends Equatable {
  const HomeState();
  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoaded extends HomeState {
  final HomeModel home;
  const HomeLoaded({required this.home});

  @override
  List<Object?> get props => [home];
}
