import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../api_service/api_constants.dart';
import '../error/failure.dart';
import '../global/no_internet/no_internet_bloc.dart';
import 'dart:async';

abstract class BaseBloc<E, S> extends Bloc<E, S> {
  BaseBloc(super.initialState);

  Future<void> executeRequest<T>({
    required Future<Either<Failure, T>> Function() request,
    required Emitter<S> emit,
    required FutureOr<void> Function(T data) onSuccess,
    FutureOr<void> Function(Failure failure)? onFailure,
    FutureOr<void> Function(Failure failure)? globalFailure,
  }) async {
    final result = await request();

    await result.fold(
      (failure) async {
        if (failure.statusCode == ApiConstants.no_internet_status_code) {
          // Global error
          GetIt.I<NoInternetBloc>().add(GlobalErrorOccurred(failure));

          await globalFailure?.call(failure);
        } else {
          // Feature-specific error
          await onFailure?.call(failure);
        }
      },
      (data) async {
        await onSuccess(data);
      },
    );
  }
}
