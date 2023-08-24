import 'package:account_book/get/controller/page/asset_page_controller.dart';
import 'package:account_book/route.dart';
import 'package:account_book/utilities/function/converter.dart';
import 'package:account_book/utilities/function/icon_converter.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/asset.dart';

class AssetPage extends StatefulWidget {
  const AssetPage({super.key});

  @override
  State<AssetPage> createState() => _AssetPageState();
}

class _AssetPageState extends State<AssetPage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('자산'),
        actions: [buildAssetAddButton()],
      ),
      body: buildBody(),
    );
  }

  // 자산 추가 버튼
  Padding buildAssetAddButton() {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: IconButton(
        icon: const Icon(FluentIcons.add_square_multiple_20_regular),
        onPressed: () {
          Get.toNamed(AppRoute.assetScreen, arguments: Asset());
        },
      ),
    );
  }

  Widget buildBody() {
    return Column(
      children: [
        ListView.separated(
          separatorBuilder: (context, index) {
            return Divider(
              thickness: 0.3,
              color: Get.theme.colorScheme.outline,
              height: 1,
              endIndent: 5,
              indent: 5,
            );
          },
          itemCount: AssetPageController.to.assets.value.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return assetRow(index);
          },
        )
      ],
    );
  }

  Widget assetRow(int index) {
    return InkWell(
      onTap: () {
        if (AssetPageController.to.assets.value.elementAt(index).level != null) {
          Get.toNamed(AppRoute.assetScreen, arguments: AssetPageController.to.assets.value.elementAt(index));
        }
      },
      splashColor: Get.theme.colorScheme.onPrimaryContainer,
      focusColor: Get.theme.colorScheme.onPrimaryContainer,
      hoverColor: Get.theme.colorScheme.onPrimaryContainer,
      highlightColor: Get.theme.colorScheme.onPrimaryContainer,
      child: Container(
        color: Get.theme.colorScheme.tertiary,
        padding: const EdgeInsets.symmetric(vertical: 3),
        child: Row(
          children: [
            SizedBox(
              width: (AssetPageController.to.assets.value.elementAt(index).level! - 1) * 23.0,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 5, 5),
              child: Icon(IconConverter.iconConverter(AssetPageController.to.assets.value.elementAt(index).accountName!)),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 3, 0, 0),
              child: Text(
                AssetPageController.to.assets.value.elementAt(index).accountName!,
                style: Get.textTheme.bodyLarge,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Text(
                  '${AppConverter.numberFormat(AssetPageController.to.assets.value.elementAt(index).sumAmount!)}원',
                  textAlign: TextAlign.right,
                  style: Get.textTheme.bodyLarge,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
