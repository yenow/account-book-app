import 'package:flutter/material.dart';

class AssetCategoryManagementScreen extends StatelessWidget {
  const AssetCategoryManagementScreen({Key? key}) : super(key: key);

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
