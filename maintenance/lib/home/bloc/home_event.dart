part of 'home_bloc.dart';

@immutable
abstract class HomeEvent extends Equatable {
  const HomeEvent();
  @override
  List<Object?> get props => [];
}

class HomeLoad extends HomeEvent {}

class HomeUpdate extends HomeEvent {
  final HomeModel homeUpdate;
  const HomeUpdate({required this.homeUpdate});

  @override
  List<Object?> get props => [homeUpdate];
}
