import 'dart:math' as math;
import 'package:account_book/data/model/chart_data.dart';
import 'package:account_book/utilities/function/convert.dart';
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
      child: AspectRatio(
        aspectRatio: 1,
        child: PieChart(
          PieChartData(
            borderData: FlBorderData(
              show: false,
            ),
            sectionsSpace: 0,
            centerSpaceRadius: 0,
            sections: showingSections(),
          ),
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(chartData.length, (index) {
      final fontSize = Get.theme.textTheme.bodyMedium?.fontSize;
      const radius = 110.0;

      return PieChartSectionData(
        color: colors.elementAt(index),
        value: chartData.elementAt(index).percent,
        title: '${Converter.numberFormat(chartData.elementAt(index).amount)}원',
        radius: radius,
        badgeWidget: Text(
          chartData.elementAt(index).accountName,
          style: TextStyle(fontSize: fontSize),
        ),
        badgePositionPercentageOffset: 0.7,
        titlePositionPercentageOffset: 1.25,
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
