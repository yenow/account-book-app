
import 'package:account_book/data/dto/account/account_request_dto.dart';
import 'package:account_book/data/dto/account/account_response_dto.dart';
import 'package:account_book/data/dto/single_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../dto/account/accounts_by_type_dto.dart';
import '../dto/login/login_request.dart';
import '../dto/login/login_response.dart';
import '../model/account.dart';
import 'clients.dart';

part 'login_client.g.dart';

@RestApi()
abstract class LoginClient {
  factory LoginClient(Dio dio, {String baseUrl}) = _LoginClient;

  @POST('/login')
  Future<SingleResponse<LoginResponse>> login({
    @Body() required LoginRequest loginRequest,
  });

  @POST('/autoLogin')
  Future<SingleResponse<LoginResponse>> autoLogin();

  @POST('/logout')
  Future<void> logout();
}