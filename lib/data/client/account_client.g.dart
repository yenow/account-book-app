// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _AccountClient implements AccountClient {
  _AccountClient(
    this._dio, {
    this.baseUrl,
  });

  final Dio _dio;

  String? baseUrl;

  @override
  Future<SingleResponse<AccountsByTypeDto>> findAccountsByAccountType() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<SingleResponse<AccountsByTypeDto>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/account/AccountsByType',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SingleResponse<AccountsByTypeDto>.fromJson(
      _result.data!,
      (json) => AccountsByTypeDto.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<ListResponse<Asset>> findAssetAmountList() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ListResponse<Asset>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/account/findAssetAmountList',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ListResponse<Asset>.fromJson(
      _result.data!,
      (json) => Asset.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<SingleResponse<AccountResponseDto>> saveAsset(
      {required accountRequestDto}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(accountRequestDto.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<SingleResponse<AccountResponseDto>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/account/save/asset',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SingleResponse<AccountResponseDto>.fromJson(
      _result.data!,
      (json) => AccountResponseDto.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<SingleResponse<AccountResponseDto>> deleteAsset(accountId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<SingleResponse<AccountResponseDto>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/account/delete/asset/${accountId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SingleResponse<AccountResponseDto>.fromJson(
      _result.data!,
      (json) => AccountResponseDto.fromJson(json as Map<String, dynamic>),
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
