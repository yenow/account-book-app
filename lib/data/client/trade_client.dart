import 'package:account_book/data/dto/trade/trade_request_dto.dart';
import 'package:account_book/data/dto/trade/trade_response_dto.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../dto/map_response.dart';
import '../dto/single_response.dart';
import '../model/trade.dart';
import 'clients.dart';

part 'trade_client.g.dart';

@RestApi()
abstract class TradeClient {
  factory TradeClient(Dio dio, {String baseUrl}) = _TradeClient;

  @POST('/trade/save')
  Future<SingleResponse<TradeResponseDto>> saveTrade({
    @Body() required TradeRequestDto trade,
  });

  @POST('/trade/delete')
  Future<SingleResponse<TradeResponseDto>> deleteTrade({
    @Body() required int tradeId,
  });


  @POST('/trade/findAllTradeOfUser')
  Future<MapResponse<Trade>> findAllTradeOfUser();  // MapResponse<Trade>
}
