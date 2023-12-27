part of 'home_cubit.dart';

abstract class HomeState {
  const HomeState();
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {
  final int type;
  HomeLoading({required this.type});
}

class HomeLoaded extends HomeState {
  final int step;
  HomeLoaded({required this.step});
}

class OtpStep extends HomeState {}

class LogOut extends HomeState {}

class HomeError extends HomeState {
  final String message;
  HomeError({required this.message});
}
