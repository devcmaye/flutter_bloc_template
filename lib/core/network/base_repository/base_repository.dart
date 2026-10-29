import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../services/network_services.dart';
import '../api_service/api_constants.dart';
import '../api_service/hash_helper.dart';
import '../base_response/hash_base_request.dart';
import '../error/app_exception.dart';
import '../error/failure.dart';
import '../global/network_error_notifier.dart';

abstract class BaseRepository {
  Future<Either<Failure, T>> execute<R, T>({
    required Future<R> Function(dynamic request) call,
    dynamic request,
  }) async {
    try {
      // Insert hash if needed
      if (request is HashBaseRequest) {
        request = _insertHash(request);
      }
      if (!await NetworkService.hasInternetConnection()) {
        NetworkErrorNotifier.instance.showNoInternet();

        return Left(
          NetworkFailure(
            ApiConstants.no_internet_status_code,
            ApiConstants.no_internet_connection,
          ),
        );
      }
      final response = await call(request) as dynamic;

      final isSuccess =
          response.status == true &&
          response.statusCode == ApiConstants.success_status_code;

      if (isSuccess) {
        debugPrint('Success Log -> ${response.message}');
        return Right(response);
      }

      return Left(
        ServerFailure(
          response.statusCode.toString(),
          response.message ?? ApiConstants.invalid_server_response,
        ),
      );
    } on NetworkException catch (e) {
      return Left(
        NetworkFailure(e.statusCode.toString(), e.message.toString()),
      );
    } on TimeoutException catch (e) {
      return Left(
        NetworkFailure(
          e.statusCode.toString(),
          ApiConstants.connection_time_out,
        ),
      );
    } on ServerException catch (e) {
      return Left(ServerFailure(e.statusCode.toString(), e.message.toString()));
    } on AppException catch (e) {
      return Left(
        UnknownFailure(
          e.statusCode.toString(),
          ApiConstants.unexpected_network_error,
        ),
      );
    } catch (_) {
      return const Left(
        UnknownFailure("-1", ApiConstants.unexpected_network_error),
      );
    }
  }

  HashBaseRequest _insertHash(HashBaseRequest request) {
    final hash = HashHelper.generateHash(
      data: request.toJson()
        ..remove("HashValue"), // don't include previous hash
      secretKey: ApiConstants.secretKey,
    );
    return request.copyWith(hashValue: hash);
  }
}
