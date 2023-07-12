import 'package:account_book/data/model/trade.dart';
import 'package:intl/intl.dart';

class Converter {
  static final f = NumberFormat('###,###,###,###');

  static String numberFormat(num num) {
    return f.format(num);
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
