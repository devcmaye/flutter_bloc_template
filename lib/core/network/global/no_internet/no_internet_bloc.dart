import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../error/failure.dart';

part 'no_internet_event.dart';
part 'no_internet_state.dart';

class NoInternetBloc extends Bloc<NoInternetEvent, NoInternetState> {
  NoInternetBloc() : super(const GlobalErrorInitial()) {
    on<GlobalErrorOccurred>(_onGlobalErrorOccurred);
  }

  void _onGlobalErrorOccurred(
    GlobalErrorOccurred event,
    Emitter<NoInternetState> emit,
  ) {
    emit(GlobalErrorStateFailure(event.failure));
  }
}
