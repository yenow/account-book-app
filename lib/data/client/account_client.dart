
import 'package:account_book/data/dto/account/account_request_dto.dart';
import 'package:account_book/data/dto/account/account_response_dto.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../dto/account/accounts_by_type_dto.dart';
import '../model/account.dart';
import 'client_list.dart';

part 'account_client.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class AccountClient {
  factory AccountClient(Dio dio, {String baseUrl}) = _AccountClient;

  @POST('/account/AccountsByType')
  Future<AccountsByTypeDto> findAccountsByAccountType({
    @Body() required AccountRequestDto accountRequestDto,
    // @Header("authorization") required String token
  });
}