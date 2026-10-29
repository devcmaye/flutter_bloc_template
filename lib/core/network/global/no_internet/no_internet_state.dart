part of 'no_internet_bloc.dart';

abstract class NoInternetState extends Equatable {
  const NoInternetState();

  @override
  List<Object?> get props => [];
}

class GlobalErrorInitial extends NoInternetState {
  const GlobalErrorInitial();
}

class GlobalErrorStateFailure extends NoInternetState {
  final Failure failure;

  const GlobalErrorStateFailure(this.failure);

  @override
  List<Object?> get props => [failure];
}
