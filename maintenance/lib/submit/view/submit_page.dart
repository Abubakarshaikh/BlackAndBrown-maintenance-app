import 'package:flutter/material.dart';
import 'package:maintenance/app/models/app_status.dart';
import 'package:maintenance/submit/bloc/submit_bloc.dart';
import 'package:my_widgets/my_widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flow_builder/flow_builder.dart';

class SubmitPage extends StatelessWidget {
  static Page page() => const MaterialPage<void>(child: SubmitPage());

  const SubmitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String desc = '';

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: BlocBuilder<SubmitBloc, SubmitState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(12.0, 40.0, 24.0, 0),
                  child: Text("Let's Submit",
                      style: Theme.of(context).textTheme.headline1),
                ),
                const SizedBox(height: 20),
                _descInput(context, onChange: (String newValue) {
                  desc = newValue;
                }),
                const SizedBox(height: 12),
                _submitButton(context, onEevent: () {
                  context.read<SubmitBloc>().add(SubmittedComplete(desc: desc));
                  context
                      .flow<String>()
                      .update((state) => AppStatus.submitComplete);
                }),
              ],
            );
          },
        ),
      ),
    );
  }
}

Widget _descInput(BuildContext context, {required Function(String) onChange}) {
  return CustomTextField(
    textInputType: TextInputType.text,
    textTheme: Theme.of(context).textTheme,
    hintText: 'desc/remarks',
    onChange: onChange,
    maxLines: 3,
  );
}

Widget _submitButton(BuildContext context, {required VoidCallback onEevent}) {
  return CustomPrimaryButton(
    textValue: 'Submit',
    onEvent: onEevent,
    theme: Theme.of(context),
  );
}
