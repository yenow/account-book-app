import 'package:account_book/data/dto/account/account_request_dto.dart';
import 'package:account_book/data/dto/account/account_response_dto.dart';
import 'package:account_book/data/dto/list_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../dto/account/accounts_by_type_dto.dart';
import '../dto/single_response.dart';
import '../model/account.dart';
import '../model/asset.dart';
import 'clients.dart';

part 'account_client.g.dart';

@RestApi()
abstract class AccountClient {
  factory AccountClient(Dio dio, {String baseUrl}) = _AccountClient;

  // 회원의 계정 목록 조회
  @POST('/account/AccountsByType')
  Future<SingleResponse<AccountsByTypeDto>> findAccountsByAccountType();

  /// 자산별 보유 금액 리스트 조회
  @POST('/account/findAssetAmountList')
  Future<ListResponse<Asset>> findAssetAmountList();

  // 자산 계정 등록
  @POST('/account/save/asset')
  Future<SingleResponse<AccountResponseDto>> saveAsset({
    @Body() required AccountRequestDto accountRequestDto,
  });

  // 자산 계정 등록
  @POST('/account/save')
  Future<SingleResponse<AccountResponseDto>> saveAccount({
    @Body() required AccountRequestDto accountRequestDto,
  });

  // 자산 계정 삭제
  @POST('/account/delete/{accountId}')
  Future<SingleResponse<AccountResponseDto>> deleteAsset(
    @Path('accountId') int accountId,
  );
}
