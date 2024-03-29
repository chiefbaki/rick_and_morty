import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRep {
  Future<UserCredential> register(
      {required String email, required String password});

  Future<UserCredential> login(
      {required String email, required String password});
}
