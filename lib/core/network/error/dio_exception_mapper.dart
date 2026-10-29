import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../api_service/api_constants.dart';
import 'app_exception.dart';
import 'dio_exception.dart';

class DioExceptionMapper {
  static AppException map(DioException e) {
    // ============================================================
    // SESSION EXPIRED
    // ============================================================

    if (e is SessionExpiredException) {
      return SessionExpiredAppException(
        ApiConstants.session_expired,
        statusCode: e.response?.statusCode,
      );
    }

    final statusCode = e.response?.statusCode ?? -1;

    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.transformTimeout:
        return TimeoutException(
          ApiConstants.connection_time_out,
          statusCode: statusCode,
        );

      case DioExceptionType.connectionError:
        if (e.error is SocketException) {
          return NetworkException(
            ApiConstants.invalid_server_response,
            statusCode: statusCode,
          );
        }
        return NetworkException(
          ApiConstants.no_internet_connection,
          statusCode: statusCode,
        );

      case DioExceptionType.badCertificate:
        return NetworkException(
          ApiConstants.invalid_server_response,
          statusCode: statusCode,
        );

      case DioExceptionType.cancel:
        return UnknownException('Request cancelled', statusCode: statusCode);

      case DioExceptionType.badResponse:
        return _handleResponse(e.response);

      case DioExceptionType.unknown:
        if (e.error is SocketException) {
          return NetworkException(
            ApiConstants.invalid_server_response,
            statusCode: statusCode,
          );
        }

        return UnknownException(
          ApiConstants.unexpected_network_error,
          statusCode: statusCode,
        );
    }
  }

  static AppException _handleResponse(Response? response) {
    if (response == null) {
      return UnknownException(ApiConstants.unexpected_network_error);
    }

    final httpStatusCode = response.statusCode ?? -1;

    debugPrint('========== HANDLE RESPONSE ==========');

    debugPrint('HTTP Status Code : $httpStatusCode');

    debugPrint('Response Data    : ${response.data}');

    // ============================================================
    // 503 - SERVICE UNAVAILABLE
    // ============================================================

    if (httpStatusCode == 503) {
      return ServerException(
        ApiConstants.service_temporary_available,
        statusCode: httpStatusCode,
      );
    }

    // ============================================================
    // API RESPONSE BODY
    // ============================================================

    if (response.data is Map) {
      final data = Map<String, dynamic>.from(response.data as Map);

      // API / BUSINESS STATUS CODE
      final apiStatusCode =
          int.tryParse(data['StatusCode']?.toString() ?? '') ?? httpStatusCode;

      // API MESSAGE
      final apiMessage =
          data['Message']?.toString() ??
          response.statusMessage ??
          ApiConstants.invalid_server_response;

      debugPrint('API Status Code  : $apiStatusCode');

      debugPrint('API Message      : $apiMessage');

      debugPrint('=====================================');

      return ServerException(apiMessage, statusCode: apiStatusCode);
    }

    // ============================================================
    // FALLBACK
    // ============================================================

    return ServerException(
      response.statusMessage ?? ApiConstants.invalid_server_response,
      statusCode: httpStatusCode,
    );
  }
}
