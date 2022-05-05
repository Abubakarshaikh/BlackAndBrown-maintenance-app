import 'package:admin/signin/signin.dart';
import 'package:carrying_ui/carrying_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:my_widgets/my_widgets.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(state.errorMessage ?? 'Authentication Failure'),
              ),
            );
        }
      },
      child: Align(
        alignment: const Alignment(0, -1 / 3),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('SIGN IN',
                    style: Theme.of(context).textTheme.headline1,
                    textAlign: TextAlign.left),
                const SizedBox(
                  height: 48,
                ),
                _EmailInput(),
                const SizedBox(
                  height: 18,
                ),
                _PasswordInput(),
                const SizedBox(
                  height: 18,
                ),
                _LoginButton(),
                const SizedBox(
                  height: 18,
                ),
                const SizedBox(
                  height: 18,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInCubit, SignInState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              key: const Key('loginForm_emailInput_textField'),
              hintText: 'Email',
              textInputType: TextInputType.emailAddress,
              onChange: (email) =>
                  context.read<SignInCubit>().emailChanged(email),
              textTheme: Theme.of(context).textTheme,
            ),
            Text(
              state.email.invalid ? 'Invalid email' : '',
              style: Theme.of(context).textTheme.caption!.copyWith(
                    fontSize: 14,
                    color: const Color(0xffff3333),
                  ),
            )
          ],
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInCubit, SignInState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              key: const Key('loginForm_passwordInput_textField'),
              hintText: 'Password',
              obscureText: true,
              textInputType: TextInputType.visiblePassword,
              onChange: (password) =>
                  context.read<SignInCubit>().passwordChanged(password),
              textTheme: Theme.of(context).textTheme,
            ),
            Text(
              state.password.invalid ? 'Invalid password' : '',
              style: Theme.of(context).textTheme.caption!.copyWith(
                    fontSize: 14,
                    color: const Color(0xffff3333),
                  ),
            )
          ],
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInCubit, SignInState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const Center(child: CircularProgressIndicator())
            : CustomPrimaryButton(
                key: const Key('loginForm_continue_raisedButton'),
                onEvent: state.status.isValidated
                    ? () => context.read<SignInCubit>().signInWithCredentials()
                    : null,
                buttonColor: state.status.isValidated
                    ? CarryingColors.black
                    : CarryingColors.black.withOpacity(0.5),
                theme: Theme.of(context),
                textValue: 'Sign in',
                textColor: state.status.isValidated
                    ? CarryingColors.white
                    : CarryingColors.white.withOpacity(0.5),
              );
      },
    );
  }
}
