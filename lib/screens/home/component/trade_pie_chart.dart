import 'dart:math' as math;
import 'package:account_book/common/constant/size.dart';
import 'package:account_book/data/model/chart_data.dart';
import 'package:account_book/common/function/converter.dart';
import 'package:account_book/common/function/icon_converter.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TradePieChart extends StatelessWidget {
  const TradePieChart({super.key, required this.chartData, required this.colors});

  final List<ChartData> chartData;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.1 / 1,
      child: PieChart(
        PieChartData(
          borderData: FlBorderData(
              // show: false,
              ),
          sectionsSpace: 1,
          centerSpaceRadius: 1,
          sections: showingSections(),
          startDegreeOffset: 10,
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(chartData.length, (index) {
      final fontSize = Get.theme.textTheme.bodyMedium?.fontSize;
      const radius = 90.0;

      return PieChartSectionData(
        color: colors.elementAt(index % colors.length),
        value: chartData.elementAt(index).percent,
        title: '${AppConverter.numberFormat(chartData.elementAt(index).amount)}원',
        titleStyle: const TextStyle(letterSpacing: 0.2),
        radius: radius,
        badgeWidget: Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 35),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 5, right: 3),
                child: Icon(
                  IconConverter.iconConverter(chartData.elementAt(index).accountName),
                  color: colors.elementAt(index % colors.length),
                ),
              ),
              Text(
                chartData.elementAt(index).accountName,
                style: TextStyle(fontSize: fontSize, letterSpacing: CommonSize.letterSpacing),
              ),
            ],
          ),
        ),
        badgePositionPercentageOffset: 1.45,
        titlePositionPercentageOffset: 1.45,
        showTitle: true,
      );
    });
  }
}

class _Badge extends StatelessWidget {
  const _Badge(
    this.svgAsset, {
    required this.size,
    required this.borderColor,
  });

  final String svgAsset;
  final double size;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: PieChart.defaultDuration,
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
          width: 2,
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(.5),
            offset: const Offset(3, 3),
            blurRadius: 3,
          ),
        ],
      ),
      padding: EdgeInsets.all(size * .15),
      child: const Center(),
    );
  }
}
