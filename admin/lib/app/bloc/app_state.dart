part of 'app_bloc.dart';

class AppState extends Equatable {
  const AppState._({
    required this.status,
    this.user = User.empty,
  });

  const AppState.authenticated(User user)
      : this._(status: PageState.authenticated, user: user);

  const AppState.unauthenticated() : this._(status: PageState.unAuthenticated);

  final String status;
  final User user;

  AppState copyWith({
    String? status,
    User? user,
  }) =>
      AppState._(status: status ?? this.status, user: user ?? this.user);

  @override
  List<Object> get props => [status, user];
}
