import 'package:firebase_auth/firebase_auth.dart';

class FireBaseServices{
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<UserCredential> makeSignUp({required String email, required String password}) async{
    final user = auth.createUserWithEmailAndPassword(email: email, password: password);
    return user;
  }

}