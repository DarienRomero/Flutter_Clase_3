import 'package:clase3/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class UserBloc implements Bloc {
  
  final _auth_repository = AuthRepository();
  
  Future<FirebaseUser> createUserWithEmailAndPassword(String userName, String email, String password) => _auth_repository.createUserWithEmailAndPassword(userName, email, password);
  Future<FirebaseUser> signInWithEmailAndPassword(String email, String password) => _auth_repository.signInWithEmailAndPassword(email,password);
  Future<FirebaseUser> signInWithGoogle() => _auth_repository.signInWithGoogle();
  @override
  void dispose(){
  }
}