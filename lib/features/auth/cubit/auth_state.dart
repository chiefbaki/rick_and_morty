part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {
  final UserCredential signUp;
  AuthSuccess({required this.signUp});
}

final class AuthError extends AuthState {
  final String error;
  AuthError({required this.error});
}
