// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trade_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _TradeClient implements TradeClient {
  _TradeClient(
    this._dio, {
    this.baseUrl,
  });

  final Dio _dio;

  String? baseUrl;

  @override
  Future<SingleResponse<TradeResponseDto>> saveTrade({required trade}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(trade.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<SingleResponse<TradeResponseDto>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/trade/save',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SingleResponse<TradeResponseDto>.fromJson(
      _result.data!,
      (json) => TradeResponseDto.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<SingleResponse<TradeResponseDto>> deleteTrade(
      {required tradeId}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = tradeId;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<SingleResponse<TradeResponseDto>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/trade/delete',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SingleResponse<TradeResponseDto>.fromJson(
      _result.data!,
      (json) => TradeResponseDto.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<MapResponse<Trade>> findAllTradeOfUser() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<MapResponse<Trade>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/trade/findAllTradeOfUser',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MapResponse<Trade>.fromJson(
      _result.data!,
      (json) => Trade.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
