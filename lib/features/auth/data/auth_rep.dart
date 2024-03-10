import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRep{
  Future<UserCredential> register({required String email, required String password});
}