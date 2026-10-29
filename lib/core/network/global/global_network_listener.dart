import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../api_service/api_constants.dart';
import '../error/failure.dart';
import 'no_internet/no_internet_bloc.dart';
import 'network_error_notifier.dart';

class GlobalErrorListener extends StatelessWidget {
  final Widget child;

  const GlobalErrorListener({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<NoInternetBloc, NoInternetState>(
      listener: (context, state) {
        if (state is! GlobalErrorStateFailure) {
          return;
        }

        final failure = state.failure;

        // No Internet
        if (failure is NetworkFailure &&
            failure.statusCode == ApiConstants.no_internet_status_code) {
          NetworkErrorNotifier.instance.showNoInternet();
          return;
        }
      },
      child: child,
    );
  }
}
