import 'package:flow_builder/flow_builder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maintenance/app/app.dart';
import 'package:maintenance/cm/bloc/cm_bloc.dart';
import 'package:maintenance/submit/bloc/submit_bloc.dart';
import 'package:my_widgets/my_widgets.dart';
import 'package:flutter/material.dart';

class CMPage extends StatelessWidget {
  const CMPage({Key? key}) : super(key: key);
  static Page page() => const MaterialPage<void>(child: CMPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24.0, 40.0, 24.0, 0),
        child: SingleChildScrollView(
          child: BlocBuilder<CmBloc, CmState>(
            builder: (context, state) {
              if (state is CmLoaded) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Corrective Maintenance',
                            style: Theme.of(context).textTheme.headline1),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Form(
                      child: Column(
                        children: [
                          CustomTextField(
                            hintText: 'Findings',
                            onChange: (newValue) {
                              context.read<CmBloc>().add(CMUpdated(
                                  cm: state.cm.copyWith(findings: newValue)));
                            },
                            textTheme: Theme.of(context).textTheme.copyWith(
                                caption: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(color: Colors.blueGrey)),
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          CustomTextField(
                            readOnly: state.cm.findings == "" &&
                                state.cm.complainerName == "",
                            hintText: 'Complainer Name',
                            onChange: (newValue) {
                              context.read<CmBloc>().add(CMUpdated(
                                  cm: state.cm
                                      .copyWith(complainerName: newValue)));
                            },
                            textTheme: Theme.of(context).textTheme,
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          CustomTextField(
                            readOnly: state.cm.complainerName == "" &&
                                state.cm.materialRequirement == "",
                            hintText: 'Material Required',
                            onChange: (newValue) {
                              context.read<CmBloc>().add(CMUpdated(
                                  cm: state.cm.copyWith(
                                      materialRequirement: newValue)));
                            },
                            textTheme: Theme.of(context).textTheme,
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    CustomPrimaryButton(
                        textColor: state.cm.findings != "" &&
                                state.cm.complainerName != "" &&
                                state.cm.materialRequirement != ""
                            ? const Color(0xff1B1B1B)
                            : const Color(0xff1B1B1B).withOpacity(0.5),
                        theme: Theme.of(context),
                        buttonColor: state.cm.findings != "" &&
                                state.cm.complainerName != "" &&
                                state.cm.materialRequirement != ""
                            ? const Color(0xffFFD800)
                            : const Color(0xffFFD800).withOpacity(0.5),
                        textValue: 'Next',
                        onEvent: state.cm.findings != "" &&
                                state.cm.complainerName != "" &&
                                state.cm.materialRequirement != ""
                            ? () {
                                context
                                    .read<SubmitBloc>()
                                    .add(CmSubmitted(cm: state.cm));
                                context
                                    .flow<String>()
                                    .update((state) => AppStatus.cmComplete);
                              }
                            : () {}),
                  ],
                );
              }
              return const Center(child: Text("Something went wrong"));
            },
          ),
        ),
      ),
    );
  }
}
