import 'package:clase3/repository/firebase_auth_api.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {

  final _firebaseAuthAPI = FirebaseAuthAPI();
  Future<FirebaseUser> createUserWithEmailAndPassword(String userName, String email, String password) => _firebaseAuthAPI.createUserWithEmailAndPassword(userName, email,password);
  Future<FirebaseUser> signInWithEmailAndPassword(String email, String password) => _firebaseAuthAPI.signInWithEmailAndPassword(email,password);
  Future<FirebaseUser> signInWithGoogle() => _firebaseAuthAPI.signInWithGoogle();
}