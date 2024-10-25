part of 'register_cubit.dart';

sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}
final class ChangeVisibaleState extends RegisterState {}
