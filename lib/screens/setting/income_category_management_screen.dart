import 'package:flutter/material.dart';

class IncomeCategoryManagementScreen extends StatelessWidget {
  const IncomeCategoryManagementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: buildScaffold());
  }

  Scaffold buildScaffold() {
    return Scaffold(
      appBar: AppBar(
        title: const Text("홈"),
      ),
      body: Container(),
    );
  }
}
