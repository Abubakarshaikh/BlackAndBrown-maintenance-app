import 'package:carrying_ui/carrying_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:admin/signin/signin.dart';
import 'view.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: SigninPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CarryingColors.white,
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: BlocProvider<SignInCubit>(
          create: (_) => SignInCubit(context.read<AuthenticationRepository>()),
          child: const SignInForm(),
        ),
      ),
    );
  }
}