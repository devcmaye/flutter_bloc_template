import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../../main.dart';
import '../../helper/device_info_helper.dart';
import '../../helper/session_manager.dart';
import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../../widgets/dialogs/session_expire_dialog.dart';
import 'api_constants.dart';

class DioHelper {
  final Dio dio;
  final Map<String, CancelToken> _requests = {};

  // Singleton instance (optional)
  static final DioHelper instance = DioHelper._internal();

  factory DioHelper() => instance;

  DioHelper._internal() : dio = Dio() {
    _configureDio();
    _listenNetworkChanges();
  }

  bool isSessionDialogShowing = false;

  void _configureDio() {
    dio.options
      ..baseUrl = ApiConstants.baseUrl
      ..connectTimeout = const Duration(seconds: 45)
      ..receiveTimeout = const Duration(seconds: 45);

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // Common headers
          options.headers.addAll({
            'X-Agent-Code': ApiConstants.userCode,
            'X-API-Key': ApiConstants.apiKey,
            'X-Channel': ApiConstants.channel,
            'X-Device-Id': DeviceInfoHelper.deviceId,
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          });

          // Public APIs that don't require authentication
          final isPublicApi = [ApiConstants.getToken].contains(options.path);

          if (!isPublicApi) {
            final session = await SessionManager.instance.getSession();

            if (session != null) {
              if (session.isExpired) {
                await _handleSessionExpired();
                // handler.reject(
                //   SessionExpiredException(requestOptions: options),
                // );
                return;
              }
              options.headers['X-Session-Id'] = session.sessionId;
              options.headers['Authorization'] =
                  'Bearer ${session.accessToken}';
            }
          }

          handler.next(options);
        },

        onError: (err, handler) async {
          if (err.response?.statusCode == 401) {
            await _handleSessionExpired();

            // handler.reject(
            //   SessionExpiredException(
            //     requestOptions: err.requestOptions,
            //     response: err.response,
            //   ),
            // );
            return;
          }
          handler.next(err);
        },
      ),
    );

    // Pretty logger
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: false,
        responseBody: true,
        error: true,
        compact: true,
        maxWidth: 120,
      ),
    );
  }

  Future<void> _handleSessionExpired() async {
    await SessionManager.instance.clear();

    final context = navigatorKey.currentContext;

    if (isSessionDialogShowing || context == null) {
      return;
    }

    isSessionDialogShowing = true;

    try {
      await showSessionExpiredDialog(context);
    } finally {
      isSessionDialogShowing = false;
    }
  }

  // ===========================
  // NETWORK LISTENER
  // ===========================
  void _listenNetworkChanges() {
    Connectivity().onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.none) {
        _cancelAllRequests('Network disconnected');
      }
    });
  }

  void _cancelAllRequests([String reason = 'Cancelled']) {
    for (final token in _requests.values) {
      if (!token.isCancelled) token.cancel(reason);
    }
    _requests.clear();
  }

  // ===========================
  // PUBLIC METHODS (no CancelToken needed)
  // ===========================
  Future<Map<String, dynamic>> post({
    required String endpoint,
    required Map<String, dynamic> body,
    String? tag,
  }) {
    return _request('POST', endpoint, body: body, tag: tag);
  }

  Future<Map<String, dynamic>> get({
    required String endpoint,
    Map<String, dynamic>? queryParams,
    String? tag,
  }) {
    return _request('GET', endpoint, queryParams: queryParams, tag: tag);
  }

  Future<Map<String, dynamic>> put({
    required String endpoint,
    required Map<String, dynamic> body,
    String? tag,
  }) {
    return _request('PUT', endpoint, body: body, tag: tag);
  }

  // ===========================
  // CORE REQUEST HANDLER
  // ===========================

  Future<Map<String, dynamic>> _request(
    String method,
    String endpoint, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParams,
    String? tag,
  }) async {
    final cancelToken = CancelToken();
    if (tag != null) _requests[tag] = cancelToken;

    try {
      final response = await dio.request(
        endpoint,
        data: body,
        queryParameters: queryParams,
        options: Options(method: method),
        cancelToken: cancelToken,
      );

      if (_isHttpSuccess(response.statusCode)) {
        final data = response.data as Map<String, dynamic>;
        if (_isApiSuccess(data)) return data;

        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
          error: data['Message'] ?? 'Request failed',
        );
      }

      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        type: DioExceptionType.badResponse,
        error: ApiConstants.invalid_server_response,
      );
    } on DioException catch (e) {
      if (CancelToken.isCancel(e)) {
        throw Exception('Request cancelled: ${e.message}');
      }
      rethrow;
    } finally {
      if (tag != null) _requests.remove(tag);
    }
  }

  bool _isHttpSuccess(int? statusCode) =>
      statusCode == 200 || statusCode == 201;

  bool _isApiSuccess(Map<String, dynamic> data) =>
      data['Status'] == true || data['StatusCode'] == '000';
}
