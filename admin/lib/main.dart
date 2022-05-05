import 'package:admin/app/app.dart';
import 'package:admin/work_order_bloc_observer.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarIconBrightness: Brightness.dark,
    statusBarColor: Colors.transparent,
  ));
  BlocOverrides.runZoned(
    () => runApp(App(
      authenticationRepository: AuthenticationRepository(),
    )),
    blocObserver: WorkOrderBlocObserver(),
  );
}
