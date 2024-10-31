part of 'register_cubit.dart';

sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}
final class ChangeVisibaleState extends RegisterState {}
final class RegisterErrorState extends RegisterState {
  final String errorMessage;

  RegisterErrorState({required this.errorMessage});
}
final class RegisterLoadingState extends RegisterState {}
final class RegisterSucessState extends RegisterState {
  final String message;

  RegisterSucessState({required this.message});
}
