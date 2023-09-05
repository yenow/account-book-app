import 'package:account_book/common/constant/size.dart';
import 'package:account_book/data/model/chart_data.dart';
import 'package:account_book/common/function/converter.dart';
import 'package:account_book/common/function/icon_converter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TradeChartRow extends StatelessWidget {
  const TradeChartRow({super.key, required this.chartData, required this.index, required this.colors});

  final ChartData chartData;
  final int index;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Get.theme.colorScheme.tertiary,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            child: Icon(IconConverter.iconConverter(chartData.accountName), color: colors.elementAt(index % colors.length),),
          ),
          Text(chartData.accountName),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(
                '${AppConverter.numberFormat(chartData.amount)}원',
                textAlign: TextAlign.right,
                style: TextStyle(letterSpacing: CommonSize.letterSpacing),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
