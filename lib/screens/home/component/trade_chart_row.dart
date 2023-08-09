import 'package:account_book/common/constant/size.dart';
import 'package:account_book/data/model/chart_data.dart';
import 'package:account_book/utilities/function/converter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TradeChartRow extends StatelessWidget {
  const TradeChartRow({super.key, required this.chartData});

  final ChartData chartData;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Get.theme.colorScheme.surface,
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            child: Icon(Icons.access_time_filled),
          ),
          Text(chartData.accountName),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(
                '${AppConverter.numberFormat(chartData.amount)}원',
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: Get.textTheme.bodyLarge?.fontSize, letterSpacing: CommonSize.letterSpacing),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
