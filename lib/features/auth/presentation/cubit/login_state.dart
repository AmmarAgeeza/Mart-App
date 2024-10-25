part of 'login_cubit.dart';

sealed class LoginState {}

final class LoginInitial extends LoginState {}
final class ChangeVisibaleState extends LoginState {}
