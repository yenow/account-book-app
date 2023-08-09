import 'package:account_book/common/constant/colors.dart';
import 'package:account_book/get/controller/page/is_loading_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';

class Loader extends StatelessWidget {
  const Loader({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        child,
        Obx(() => buildIndicator()),
      ],
    );
  }

  Widget buildIndicator() {
    return Offstage(
      offstage: !IsLoadingController.to.isLoading.value, // isLoading 이 false 이면 감춤
      child: Stack(
        children: [
          const Opacity(
            opacity: 0.5,
            child: ModalBarrier(dismissible: false, color: Colors.black),
          ),
          Center(
            child: SizedBox(
              width: 100,
              child: LoadingIndicator(
                strokeWidth: 1,
                indicatorType: Indicator.ballPulseSync,
                colors: [CommonColors.red1, CommonColors.blue1, CommonColors.purple1],
                backgroundColor: Colors.transparent,
                pathBackgroundColor: Get.theme.colorScheme.onPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
