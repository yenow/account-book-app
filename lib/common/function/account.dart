
import '../../data/model/trade.dart';

String convertAccountType(String accountType) {
  return accountType == TradeType.income.name ? '수입' : '지출';
}