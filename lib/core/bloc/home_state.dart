part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

class HomeLoaded extends HomeState {
  final List<BusinessModel> businesses;

  const HomeLoaded(this.businesses);

  @override
  List<Object> get props => [businesses.length];
}

final class HomeLoading extends HomeLoaded {
  const HomeLoading(super.businesses);

  @override
  List<Object> get props => [businesses.length];
}

final class HomeFullyLoaded extends HomeLoaded {
  const HomeFullyLoaded(super.businesses);

  @override
  List<Object> get props => [businesses.length];
}

final class HomeError extends HomeState {
  final String message;

  const HomeError(this.message);

  @override
  List<Object> get props => [message];
}
