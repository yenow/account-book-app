import 'package:account_book/screens/home/component/trade_chart_row.dart';
import 'package:account_book/screens/home/component/trade_pie_chart.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/constant/colors.dart';
import '../../../get/controller/page/chart_page_controller.dart';

class ChartPage extends StatefulWidget {
  const ChartPage({super.key});

  @override
  State<ChartPage> createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('차트'),
        ),
        body: Obx(
          () => Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              buildMonthIndicator(),
              buildTabBar(),
              Expanded(
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    buildIncomeChart(),
                    buildExpenseChart(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TabBar buildTabBar() {
    return TabBar(tabs: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Text(
          '수입',
          style: Get.textTheme.bodyLarge,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Text(
          '지출',
          style: Get.textTheme.bodyLarge,
        ),
      ),
    ]);
  }

  Widget buildIncomeChart() {
    return SingleChildScrollView(
      child: Column(
        children: [
          TradePieChart(
            colors: CommonColors.incomeColors,
            chartData: ChartPageController.to.incomeChartData.value,
          ),
          ListView.builder(
            itemCount: ChartPageController.to.incomeChartData.value.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return TradeChartRow(
                chartData: ChartPageController.to.incomeChartData.value.elementAt(index),
                index: index,
                colors: CommonColors.incomeColors,
              );
            },
          )
        ],
      ),
    );
  }

  Widget buildExpenseChart() {
    return SingleChildScrollView(
      child: Column(
        children: [
          TradePieChart(
            colors: CommonColors.expenseColors,
            chartData: ChartPageController.to.expenseChartData.value,
          ),
          ListView.builder(
            itemCount: ChartPageController.to.expenseChartData.value.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return TradeChartRow(
                chartData: ChartPageController.to.expenseChartData.value.elementAt(index),
                index: index,
                colors: CommonColors.expenseColors,
              );
            },
          )
        ],
      ),
    );
  }

  Widget buildMonthIndicator() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 1,
            child: Align(
              alignment: Alignment.center,
              child: IconButton(
                onPressed: ChartPageController.to.goToPreviousMonth,
                icon: const Icon(FluentIcons.chevron_left_20_regular, size: 20),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Text(
              '${ChartPageController.to.selectedDay.value.year}년 ${ChartPageController.to.selectedDay.value.month}월',
              style: Get.textTheme.bodyLarge,
            ),
          ),
          Flexible(
            flex: 1,
            child: Align(
              alignment: Alignment.center,
              child: IconButton(
                onPressed: ChartPageController.to.goToNextMonth,
                icon: const Icon(FluentIcons.chevron_right_20_regular, size: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
