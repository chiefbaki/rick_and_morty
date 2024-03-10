import 'package:firebase_auth/firebase_auth.dart';
import 'package:rick_and_morty/features/auth/data/auth_rep.dart';
import 'package:rick_and_morty/features/auth/domain/auth_usecase.dart';

class AuthImpl implements AuthRep {
  final AuthUseCase useCase;
  AuthImpl({required this.useCase});
  @override
  Future<UserCredential> register(
      {required String email, required String password}) async {
    return useCase.register(email: email, password: password);
  }
}
