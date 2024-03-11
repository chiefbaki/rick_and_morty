import 'package:firebase_auth/firebase_auth.dart';

class AuthUseCase {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<UserCredential> register(
      {required String email, required String password}) async {
    final user =
        auth.createUserWithEmailAndPassword(email: email, password: password);
    return user;
  }

  Future<UserCredential> login(
      {required String email, required String password}) async {
    final user =
        auth.signInWithEmailAndPassword(email: email, password: password);
    return user;
  }
}
