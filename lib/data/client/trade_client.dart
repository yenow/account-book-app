
import 'package:account_book/data/dto/trade/trade_request_dto.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../model/trade.dart';
import 'client_list.dart';

part 'trade_client.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class TradeClient {
  factory TradeClient(Dio dio, {String baseUrl}) = _TradeClient;

  @POST('/trade/save')
  Future<TradeRequestDto> save({
    @Body() required TradeRequestDto trade,
    // @Header("authorization") required String token
  });
}