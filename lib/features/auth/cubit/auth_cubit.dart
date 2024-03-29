import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty/features/auth/data/auth_rep.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.repository}) : super(AuthInitial());

  Future<void> makeSignUp(
      {required String email, required String password}) async {
    emit(AuthLoading());
    try {
      final UserCredential signUp =
          await repository.register(email: email, password: password);
      emit(AuthSuccess(signUp: signUp));
    } catch (e) {
      emit(AuthError(error: e.toString()));
    }
  }

  Future<void> makeSignIn(
      {required String email, required String password}) async {
    emit(AuthLoading());
    try {
      final UserCredential signIn =
          await repository.login(email: email, password: password);
      emit(AuthSuccess(signIn: signIn));
    } catch (e) {
      emit(AuthError(error: e.toString()));
    }
  }

  final AuthRep repository;
}
