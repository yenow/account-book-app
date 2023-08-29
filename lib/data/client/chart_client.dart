import 'package:account_book/data/dto/trade/trade_request_dto.dart';
import 'package:account_book/data/dto/trade/trade_response_dto.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../dto/chart/chart_request_dto.dart';
import '../dto/chart/chart_response_dto.dart';
import '../dto/map_response.dart';
import '../dto/single_response.dart';
import '../model/trade.dart';
import 'clients.dart';

part 'chart_client.g.dart';

@RestApi()
abstract class ChartClient {
  factory ChartClient(Dio dio, {String baseUrl}) = _ChartClient;

  @POST('/trade/findChartData')
  Future<SingleResponse<ChartResponseDto>> findChartData({
    @Body() required ChartRequestDto chartRequestDto,
  });
}
