import 'package:flutter/material.dart';
import 'view.dart';

class PMPage extends StatelessWidget {
  static Page page() => const MaterialPage<void>(child: PMPage());
  const PMPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: PmBody()),
    );
  }
}









 // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   leading: GestureDetector(
      //     onTap: () {
      //       context
      //           .flow<AppStatus>()
      //           .update((state) => AppStatus.authenticated);
      //     },
      //     child: const Icon(
      //       Icons.arrow_back_outlined,
      //       color: Colors.black,
      //     ),
      //   ),
      //   elevation: 0.6,
      //   centerTitle: true,
      //   title: Text("Preventive", style: Theme.of(context).textTheme.headline1),
      // ),