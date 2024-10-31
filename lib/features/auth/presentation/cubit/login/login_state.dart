part of 'login_cubit.dart';

sealed class LoginState {}

final class LoginInitial extends LoginState {}
final class ChangeVisibaleState extends LoginState {}
final class LoginErrorState extends LoginState {
  final String errorMessage;

  LoginErrorState({required this.errorMessage});
}
final class LoginLoadingState extends LoginState {}
final class LoginSucessState extends LoginState {
  final String message;

  LoginSucessState({required this.message});
}
