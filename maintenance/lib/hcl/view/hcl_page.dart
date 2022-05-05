import 'package:flutter/material.dart';
import 'view.dart';

class HclPage extends StatelessWidget {
  static Page page() => const MaterialPage<void>(child: HclPage());
  const HclPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child:  PmBody()),
    );
  }
}

