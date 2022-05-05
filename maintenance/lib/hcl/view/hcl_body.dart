import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maintenance/app/app.dart';
import 'package:maintenance/hcl/bloc/hcl_bloc.dart';
import 'package:maintenance/submit/bloc/submit_bloc.dart';
import 'package:maintenance_repository/maintenance_repository.dart';
import 'package:my_widgets/my_widgets.dart';
import 'hcl_expansion.dart';
import 'package:flow_builder/flow_builder.dart';

class PmBody extends StatelessWidget {
  const PmBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.select((AppBloc bloc) => bloc.state.user);
    return BlocBuilder<HclBloc, HclState>(
      builder: (context, state) {
        if (state is HclInitial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is HclLoaded) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12.0, 40.0, 24.0, 0),
                      child: Text('Hourly Checklist',
                          style: Theme.of(context).textTheme.headline1),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    HclExpansion(checkLists: state.checkLists),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: CustomPrimaryButton(
                    buttonColor: state.checkLists
                            .every((element) => element.status == true)
                        ? const Color(0xffFFD800)
                        : const Color(0xffFFD800).withOpacity(0.3),
                    textColor: state.checkLists
                            .every((element) => element.status == true)
                        ? const Color(0xff1B1B1B)
                        : const Color(0xff1B1B1B).withOpacity(0.3),
                    theme: Theme.of(context),
                    textValue: 'Next',
                    onEvent: state.checkLists
                                .every((element) => element.status == true) ==
                            true
                        ? () {
                            context.read<SubmitBloc>().add(HclSubmitted(
                                    hcl: Hcl(
                                  id: user.id,
                                  email: user.email!,
                                  fullName: '',
                                  phoneNumber: 0,
                                  desc: '',
                                  coordinate: '',
                                  startingTime: '',
                                  endingTime: '',
                                  department: '',
                                  branch: '',
                                  checkLists: state.checkLists,
                                )));
                            context
                                .flow<String>()
                                .update((state) => AppStatus.hclComplete);
                          }
                        : () {}),
              ),
            ],
          );
        }
        return Center(
            child: Text('Something went Wromg',
                style: Theme.of(context).textTheme.bodyText1));
      },
    );
  }
}
