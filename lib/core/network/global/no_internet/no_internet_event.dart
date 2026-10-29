part of 'no_internet_bloc.dart';

abstract class NoInternetEvent extends Equatable {
  const NoInternetEvent();

  @override
  List<Object?> get props => [];
}

class GlobalErrorOccurred extends NoInternetEvent {
  final Failure failure;

  const GlobalErrorOccurred(this.failure);

  @override
  List<Object?> get props => [failure];
}
