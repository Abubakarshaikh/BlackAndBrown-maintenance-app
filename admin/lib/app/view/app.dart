import 'package:admin/filter/bloc/filter_bloc.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:admin/app/app.dart';
import 'package:carrying_ui/carrying_ui.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maintenance_repository/maintenance_repository.dart';
import 'package:admin/work_order/bloc/work_order_bloc.dart';
import 'package:admin/work_order_details/bloc/work_order_details_bloc.dart';

class App extends StatelessWidget {
  static Page page() => MaterialPage<void>(
      child: App(authenticationRepository: AuthenticationRepository()));

  final AuthenticationRepository _authenticationRepository;
  const App(
      {Key? key, required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthenticationRepository>(
            create: (context) => _authenticationRepository),
        RepositoryProvider<MaintenanceRepository>(
            create: (context) => MaintenanceRepository())
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                AppBloc(authenticationRepository: _authenticationRepository),
          ),
          BlocProvider(
              create: (context) =>
                  WorkOrderBloc(context.read<MaintenanceRepository>())
                    ..add(EventWorkOrderLoad())),
          BlocProvider(
            create: (context) => FilterBloc(),
          ),
          BlocProvider(
            create: (context) => WorkOrderDetailsBloc(),
          ),
          BlocProvider(
            create: (context) => FilterBloc(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: CarryingTheme.standard,
          home: const AppView(),
        ),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlowBuilder(
      state: context.select((AppBloc bloc) => bloc.state.status),
      onGeneratePages: onGenerateAppViewPages,
    );
  }
}
