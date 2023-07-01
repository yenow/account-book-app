
import 'package:intl/intl.dart';

var f = NumberFormat('###,###,###,###');

String numberFormat(int num) {
  return f.format(num);

}