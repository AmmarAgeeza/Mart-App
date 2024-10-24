part of 'on_boarding_cubit.dart';

sealed class OnBoardingState {}

final class OnBoardingInitial extends OnBoardingState {}
final class OnBoardingLoading extends OnBoardingState {}
final class OnBoardingSucess extends OnBoardingState {}
final class OnBoardingError extends OnBoardingState {
  final String error;

  OnBoardingError({required this.error});
}
