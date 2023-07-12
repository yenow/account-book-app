
import 'package:account_book/data/client/trade_client.dart';
import 'package:dio/dio.dart';

import 'account_client.dart';

final dio = Dio();
const baseUrl = 'http://192.168.0.6:8080';

final accountClient = AccountClient(dio);
final tradeClient = TradeClient(dio);
