part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

class AppLogoutRequested extends AppEvent {}

class AppUserChanged extends AppEvent {
  @visibleForTesting
  const AppUserChanged(this.user);

  final User user;

  @override
  List<Object> get props => [user];
}

class AppUserInfo extends AppEvent {
  const AppUserInfo(this.user);

  final User user;

  @override
  List<Object> get props => [user];
}

class AppNavigation extends AppEvent {
  final AppState appState;

  const AppNavigation({required this.appState});
  @override
  List<Object> get props => [appState];
}
