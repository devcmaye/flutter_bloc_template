import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import '../../../modules/template/data/models/requests/template_request.dart';
import '../../../modules/template/data/models/responses/template_response.dart';
import '../error/app_exception.dart';
import '../error/dio_exception.dart';
import '../error/dio_exception_mapper.dart';
import 'api_constants.dart';
import 'api_service.dart';
import 'dio_helper.dart';

@LazySingleton(as: ApiService)
class ApiServiceImpl implements ApiService {
  final DioHelper _dio;

  ApiServiceImpl(this._dio);

  //Template
  @override
  Future<TemplateResponse> callTemplate(TemplateRequest request) async {
    return _post<TemplateResponse>(
      endpoint: ApiConstants.getToken,
      body: request.toJson(),
      fromJson: (json) => TemplateResponse.fromJson(json),
    );
  }

  Future<R> _post<R>({
    required String endpoint,
    required Map<String, dynamic> body,
    required R Function(Map<String, dynamic> json) fromJson,
  }) async {
    try {
      debugPrint("========== REQUEST ==========");
      debugPrint("Endpoint : $endpoint");
      debugPrint("Body     : $body");

      final Map<String, dynamic> data = await _dio.post(
        endpoint: endpoint,
        body: body,
      );

      debugPrint("Response : $data");

      return fromJson(data);
    } on SessionExpiredException {
      // IMPORTANT:
      // DioHelper already showed the custom dialog.
      // Do NOT convert to Unexpected Network Error.
      rethrow;
    } on DioException catch (e) {
      debugPrint("========== DIO ERROR ==========");
      debugPrint("Type      : ${e.type}");
      debugPrint("Message   : ${e.message}");
      debugPrint("Error     : ${e.error}");
      debugPrint("Response  : ${e.response}");
      debugPrint("Status    : ${e.response?.statusCode}");
      debugPrint("URI       : ${e.requestOptions.uri}");
      debugPrint("Headers   : ${e.requestOptions.headers}");
      debugPrint("Body      : ${e.requestOptions.data}");
      debugPrint("==============================");

      throw DioExceptionMapper.map(e);
    } catch (e) {
      throw UnknownException(ApiConstants.unexpected_network_error);
    }
  }

  Future<R> _get<R>({
    required String endpoint,
    Map<String, dynamic>? queryParams,
    required R Function(Map<String, dynamic> json) fromJson,
  }) async {
    try {
      final Map<String, dynamic> data = await _dio.get(
        endpoint: endpoint,
        queryParams: queryParams,
      );

      return fromJson(data);
    } on SessionExpiredException {
      // Custom dialog already shown.
      rethrow;
    } on DioException catch (e) {
      throw DioExceptionMapper.map(e);
    } catch (e) {
      throw UnknownException(ApiConstants.unexpected_network_error);
    }
  }
}
