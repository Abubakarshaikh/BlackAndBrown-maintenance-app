import 'package:flutter/material.dart';
import 'package:maintenance/app/app.dart';
import 'package:my_widgets/my_widgets.dart';
import 'package:flow_builder/flow_builder.dart';

class SubmittedPage extends StatelessWidget {
  static Page page() => const MaterialPage<void>(child: SubmittedPage());

  const SubmittedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Your DATA is Submitted\n Thank you!",
              style: Theme.of(context).textTheme.headline2,
              textAlign: TextAlign.center,
            ),
            CustomPrimaryButton(
              textValue: 'go to home',
              theme: Theme.of(context),
              onEvent: () {
                context
                    .flow<String>()
                    .update((state) => AppStatus.submittedComplete);
              },
            ),
          ],
        ),
      ),
    );
  }
}
