part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {
  final UserCredential? signUp;
  final UserCredential? signIn;
  AuthSuccess({this.signUp, this.signIn});
}

final class AuthError extends AuthState {
  final String error;
  AuthError({required this.error});
}
