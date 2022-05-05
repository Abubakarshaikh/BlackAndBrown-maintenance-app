import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maintenance/app/app.dart';
import 'package:maintenance/home/home.dart';
import 'package:maintenance/submit/bloc/submit_bloc.dart';
import 'package:my_widgets/my_widgets.dart';
import 'package:flow_builder/flow_builder.dart';

class HomePage extends StatelessWidget {
  static Page page() => const MaterialPage<void>(child: HomePage());

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.select((AppBloc bloc) => bloc.state.user);
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is HomeLoaded) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    _buildHeader(context),
                    const SizedBox(
                      height: 36,
                    ),
                    _nameInput(context, onChange: (newValue) {
                      context.read<HomeBloc>().add(HomeUpdate(
                          homeUpdate: state.home.copyWith(fullName: newValue)));
                    },
                        textTheme: state.home.fullName != ''
                            ? Theme.of(context).textTheme
                            : Theme.of(context).textTheme.copyWith(
                                caption: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(color: Colors.blueGrey))),
                    const SizedBox(
                      height: 20,
                    ),
                    _numberInput(
                      context,
                      onChange: (newValue) {
                        context.read<HomeBloc>().add(HomeUpdate(
                            homeUpdate:
                                state.home.copyWith(phoneNumber: newValue)));
                      },
                      readOnly: state.home.fullName != '' ||
                              state.home.phoneNumber != ''
                          ? false
                          : true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: DropDownBtn(
                        hintTextColor: state.home.phoneNumber != ""
                            ? const Color(0xff1B1B1B)
                            : const Color(0xff1B1B1B).withOpacity(0.5),
                        theme: Theme.of(context),
                        title: 'Select Branch',
                        selectedValue: state.home.selectedBranch,
                        onChange: (String? newValue) {
                          state.home.copyWith(selectedBranch: newValue);
                          context.read<HomeBloc>().add(HomeUpdate(
                              homeUpdate: state.home
                                  .copyWith(selectedBranch: newValue)));
                        },
                        items: state.home.phoneNumber != '' ||
                                state.home.selectedBranch != 'Select Branch'
                            ? state.home.branches
                            : const [],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: DropDownBtn(
                        hintTextColor:
                            state.home.selectedBranch != "Select Branch"
                                ? const Color(0xff1B1B1B)
                                : const Color(0xff1B1B1B).withOpacity(0.5),
                        theme: Theme.of(context),
                        title: 'Select Department',
                        selectedValue: state.home.selectedDepartment,
                        onChange: (String? newValue) {
                          context.read<HomeBloc>().add(HomeUpdate(
                                  homeUpdate: state.home.copyWith(
                                selectedMaintenance: 'Select Maintenance',
                                selectedDepartment: newValue,
                                maintenance: newValue != "Branches"
                                    ? [
                                        "Corrective Maintenance",
                                        "Preventive Maintenance"
                                      ]
                                    : ["Hourly Checklist"],
                              )));
                        },
                        items: state.home.selectedBranch != "Select Branch"
                            ? state.home.departments
                            : const [],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: DropDownBtn(
                        hintTextColor:
                            state.home.selectedDepartment != "Select Department"
                                ? const Color(0xff1B1B1B)
                                : const Color(0xff1B1B1B).withOpacity(0.5),
                        theme: Theme.of(context),
                        title: 'Select Maintenance',
                        selectedValue: state.home.selectedMaintenance,
                        onChange: (String? newValue) {
                          context.read<HomeBloc>().add(HomeUpdate(
                                  homeUpdate: state.home.copyWith(
                                selectedMaintenance: newValue,
                              )));
                        },
                        items:
                            state.home.selectedDepartment != "Select Department"
                                ? state.home.maintenance
                                : const [],
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomPrimaryButton(
                        textColor: state.home.selectedMaintenance !=
                                    "Select Maintenance" &&
                                state.home.selectedDepartment !=
                                    "Select Department" &&
                                state.home.selectedBranch != "Select Branch" &&
                                state.home.phoneNumber != '' &&
                                state.home.fullName != ''
                            ? const Color(0xff1B1B1B)
                            : const Color(0xff1B1B1B).withOpacity(0.5),
                        theme: Theme.of(context),
                        textValue: 'Next',
                        buttonColor: state.home.selectedMaintenance !=
                                    "Select Maintenance" &&
                                state.home.selectedDepartment !=
                                    "Select Department" &&
                                state.home.selectedBranch != "Select Branch" &&
                                state.home.phoneNumber != '' &&
                                state.home.fullName != ''
                            ? const Color(0xffFFD800)
                            : const Color(0xffFFD800).withOpacity(0.3),
                        onEvent: state.home.selectedMaintenance !=
                                    "Select Maintenance" &&
                                state.home.selectedDepartment !=
                                    "Select Department" &&
                                state.home.selectedBranch != "Select Branch" &&
                                state.home.phoneNumber != '' &&
                                state.home.fullName != ''
                            ? () {
                                context
                                    .read<SubmitBloc>()
                                    .add(SubmittedUserInfo(
                                        homeModel: state.home.copyWith(
                                      initialTime: DateTime.now(),
                                      email: user.email,
                                      id: user.id,
                                    )));
                                switch (state.home.selectedMaintenance) {
                                  case 'Corrective Maintenance':
                                    return context.flow<String>().update(
                                        (state) =>
                                            AppStatus.homeCompletedWithCm);
                                  case 'Preventive Maintenance':
                                    return context.flow<String>().update(
                                        (state) =>
                                            AppStatus.homeCompletedWithPm);
                                  case 'Hourly Checklist':
                                    return context.flow<String>().update(
                                        (state) =>
                                            AppStatus.homeCompletedWithHcl);
                                  default:
                                    return context.flow<String>().update(
                                        (state) => AppStatus.authenticated);
                                }
                              }
                            : () {}),
                  ],
                ),
              ),
            );
          }
          return const Center(
            child: Text("Something went wrong!"),
          );
        },
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 7 * 3, left: 3),
      child: Text('What would you \nlike to do?',
          style: Theme.of(context).textTheme.headline1),
    );
  }

  Widget _nameInput(BuildContext context,
      {required Function(String) onChange, required TextTheme textTheme}) {
    return CustomTextField(
      textInputType: TextInputType.text,
      textTheme: textTheme,
      hintText: 'Full Name',
      onChange: onChange,
    );
  }

  Widget _numberInput(BuildContext context,
      {required Function(String) onChange, bool readOnly = false}) {
    return CustomTextField(
      textInputType: TextInputType.text,
      textTheme: Theme.of(context).textTheme,
      hintText: 'Phone Number',
      onChange: onChange,
      readOnly: readOnly,
    );
  }
}
