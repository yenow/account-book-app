import 'package:account_book/screens/home/component/trade_chart_row.dart';
import 'package:account_book/screens/home/component/trade_pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../get/controller/page/chart_page_controller.dart';

class ChartPage extends StatelessWidget {
  const ChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('차트'),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            buildHeader(),
            TabBar(tabs: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Text('수입', style: Get.textTheme.bodyLarge,),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Text('지출', style: Get.textTheme.bodyLarge,),
              ),
            ]),
            Expanded(
              child: TabBarView(children: [
                buildIncomeChart(),
                buildExpenseChart(),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildIncomeChart() {
    return SingleChildScrollView(
      child: Column(
        children: [
          TradePieChart(
            colors: ChartPageController.to.colors,
            chartData: ChartPageController.to.incomeChartData.value,
          ),
          ListView.builder(
            itemCount: ChartPageController.to.incomeChartData.value.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return TradeChartRow(chartData: ChartPageController.to.incomeChartData.value.elementAt(index));
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
            colors: ChartPageController.to.colors,
            chartData: ChartPageController.to.expenseChartData.value,
          ),
          ListView.builder(
            itemCount: ChartPageController.to.expenseChartData.value.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return TradeChartRow(chartData: ChartPageController.to.expenseChartData.value.elementAt(index));
            },
          )
        ],
      ),
    );
  }

  Widget buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Flexible(
            flex: 1,
            child: Align(alignment: Alignment.center, child: Icon(Icons.chevron_left, size: 20) // Icons.chevron_left
                ),
          ),
          Flexible(
            flex: 1,
            child: Text(
              '${ChartPageController.to.selectedDay.value.year}년 ${ChartPageController.to.selectedDay.value.month}월',
              style: Get.textTheme.bodyLarge,
            ),
          ),
          const Flexible(flex: 1, child: Align(alignment: Alignment.center, child: Icon(Icons.chevron_right, size: 20))),
        ],
      ),
    );
  }
}
