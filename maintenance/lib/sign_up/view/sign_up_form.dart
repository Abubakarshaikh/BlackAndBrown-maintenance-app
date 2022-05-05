import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maintenance/app/app.dart';
import 'package:maintenance/sign_up/sign_up.dart';
import 'package:formz/formz.dart';
import 'package:my_widgets/my_widgets.dart';
import 'package:flow_builder/flow_builder.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state.status.isSubmissionSuccess) {
          Navigator.of(context).pop();
        } else if (state.status.isSubmissionFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text(state.errorMessage ?? 'Sign Up Failure')),
            );
        }
      },
      child: Align(
        alignment: const Alignment(0, -1 / 3),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('SIGN UP',
                  style: Theme.of(context).textTheme.headline1,
                  textAlign: TextAlign.left),
              const SizedBox(
                height: 48,
              ),
              _EmailInput(),
              const SizedBox(height: 8),
              _PasswordInput(),
              const SizedBox(height: 8),
              _ConfirmPasswordInput(),
              const SizedBox(height: 8),
              _SignUpButton(),
              const SizedBox(
                height: 18,
              ),
              TextButton(
                onPressed: () {
                  context
                      .flow<String>()
                      .update((state) => AppStatus.unauthenticated);
                },
                child: RichText(
                  text: TextSpan(
                    text: 'Already have an  account? ',
                    style: Theme.of(context).textTheme.button,
                    children: [
                      TextSpan(
                          text: 'Sign in',
                          style: Theme.of(context)
                              .textTheme
                              .button!
                              .copyWith(fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              key: const Key('signUpForm_emailInput_textField'),
              hintText: 'Email',
              textInputType: TextInputType.emailAddress,
              onChange: (email) =>
                  context.read<SignUpCubit>().emailChanged(email),
              textTheme: Theme.of(context).textTheme,
            ),
            Text(
              state.email.invalid ? 'invalid email' : '',
              style: Theme.of(context).textTheme.caption!.copyWith(
                    fontSize: 14,
                    color: const Color(0xffff3333),
                  ),
            ),
          ],
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              key: const Key('signUpForm_passwordInput_textField'),
              hintText: 'Password',
              textInputType: TextInputType.visiblePassword,
              obscureText: true,
              onChange: (password) =>
                  context.read<SignUpCubit>().passwordChanged(password),
              textTheme: Theme.of(context).textTheme,
            ),
            Text(
              state.password.invalid ? 'invalid password' : '',
              style: Theme.of(context).textTheme.caption!.copyWith(
                    fontSize: 14,
                    color: const Color(0xffff3333),
                  ),
            ),
          ],
        );
      },
    );
  }
}

class _ConfirmPasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) =>
          previous.password != current.password ||
          previous.confirmedPassword != current.confirmedPassword,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              key: const Key('signUpForm_confirmedPasswordInput_textField'),
              hintText: 'Confirm Password',
              textInputType: TextInputType.visiblePassword,
              obscureText: true,
              onChange: (confirmPassword) => context
                  .read<SignUpCubit>()
                  .confirmedPasswordChanged(confirmPassword),
              textTheme: Theme.of(context).textTheme,
            ),
            Text(
              state.confirmedPassword.invalid ? 'passwords do not match' : '',
              style: Theme.of(context).textTheme.caption!.copyWith(
                    fontSize: 14,
                    color: const Color(0xffff3333),
                  ),
            ),
          ],
        );
      },
    );
  }
}

class _SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : CustomPrimaryButton(
                key: const Key('signUpForm_continue_raisedButton'),
                onEvent: state.status.isValidated
                    ? () => context.read<SignUpCubit>().signUpFormSubmitted()
                    : null,
                buttonColor: state.status.isValidated
                    ? const Color(0xffFFD800)
                    : const Color(0xffFFD800).withOpacity(0.5),
                theme: Theme.of(context),
                textValue: 'SIGN UP',
                textColor: state.status.isValidated
                    ? const Color(0xff1B1B1B)
                    : const Color(0xff1B1B1B).withOpacity(0.5),
              );
      },
    );
  }
}
