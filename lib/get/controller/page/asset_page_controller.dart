import 'dart:math';

import 'package:account_book/data/client/clients.dart';
import 'package:get/get.dart';

import '../../../data/dto/list_response.dart';
import '../../../data/model/asset.dart';

class AssetPageController extends GetxController {
  static AssetPageController get to => Get.find();

  final assets = Rx<List<Asset>>([]);

  /// 자산 목록 조회
  Future<void> findAssets() async {
    await accountClient.findAssetAmountList().then((ListResponse<Asset> value) {
      List<Asset>? assetList = value.data;

      if (assetList != null) {
        int sumAmount = 0;
        for (Asset element in assetList) {
          if (element.level == 1) {
            sumAmount = sumAmount + element.sumAmount!;
          }
        }
        assetList.insert(0, Asset(accountName: '총 자산', sumAmount: sumAmount, level: 1));
      }
      assets(assetList);
    });
  }
}
