import 'package:account_book/data/dto/account/account_request_dto.dart';
import 'package:account_book/data/dto/account/account_response_dto.dart';
import 'package:account_book/data/dto/list_response.dart';
import 'package:account_book/data/dto/single_response.dart';
import 'package:account_book/data/model/notify.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../dto/account/accounts_by_type_dto.dart';
import '../model/account.dart';
import 'clients.dart';

part 'notify_client.g.dart';

@RestApi()
abstract class NotifyClient {
  factory NotifyClient(Dio dio, {String baseUrl}) = _NotifyClient;

  @GET('/notify/findAll')
  Future<ListResponse<Notify>> findAll();
}
