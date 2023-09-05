import 'package:account_book/data/model/trade.dart';
import 'package:intl/intl.dart';

import '../../common/log_config.dart';

class AppConverter {
  static final f = NumberFormat('###,###,###,###');
  static final monthFormat = DateFormat('yyyyMM');
  static final dayFormat = DateFormat('yyyyMMdd');
  static final dayDashFormat = DateFormat('yyyy.MM.dd');

  static String convertWeekDay(int index) {
    switch (index) {
      case 0:
        return '일';
      case 1:
        return '월';
      case 2:
        return '화';
      case 3:
        return '수';
      case 4:
        return '목';
      case 5:
        return '금';
      case 6:
        return '토';
    }
    return '';
  }

  // 화폐 단위로 변경
  static String numberFormat(num num) {
    return f.format(num);
  }

  static String toMonthString(DateTime dateTime) {
    return monthFormat.format(dateTime);
  }

  static String toDayString(DateTime dateTime) {
    return dayFormat.format(dateTime);
  }

  static String toDayDashString(DateTime dateTime) {
    return dayDashFormat.format(dateTime);
  }

  static DateTime toDateTime(String day) {
    return DateTime.parse(day);
  }

  static String convertTradeType(String value) {
    if (value == TradeType.income.name) {
      return TradeType.income.tradeTypeName;
    } else if (value == TradeType.expense.name) {
      return TradeType.expense.tradeTypeName;
    } else if (value == TradeType.transfer.name) {
      return TradeType.transfer.tradeTypeName;
    }
    return '';
  }
}
