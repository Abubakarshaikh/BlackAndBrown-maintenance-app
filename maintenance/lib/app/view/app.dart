import 'package:authentication_repository/authentication_repository.dart';
import 'package:carrying_ui/carrying_ui.dart';
import 'package:maintenance/app/app.dart';
import 'package:maintenance/app_theme.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maintenance/cm/bloc/cm_bloc.dart';
import 'package:maintenance/hcl/bloc/hcl_bloc.dart';
import 'package:maintenance/home/home.dart';
import 'package:maintenance/pm/bloc/pm_bloc.dart';
import 'package:maintenance/submit/bloc/submit_bloc.dart';
import 'package:maintenance_repository/maintenance_repository.dart';

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
                HomeBloc(MaintenanceRepository())..add(HomeLoad()),
          ),
          BlocProvider(
              create: (context) =>
                  PmBloc(MaintenanceRepository())..add(PmLoad())),
          BlocProvider(
              create: (context) =>
                  HclBloc(MaintenanceRepository())..add(HclLoad())),
          BlocProvider(create: (context) => CmBloc()..add(CmLoad())),
          BlocProvider<SubmitBloc>(
              create: (context) => SubmitBloc(MaintenanceRepository())
                ..add(const SubmittedComplete())),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light(),
          // theme: CarryingTheme.standard,
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
