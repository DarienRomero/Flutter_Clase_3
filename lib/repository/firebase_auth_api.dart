import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthAPI {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  
  // sign in with email and password
  Future<FirebaseUser> signInWithEmailAndPassword(String email, String password) async {
    AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
    FirebaseUser user = result.user;
    return user;
  }
  // register with email and password
  Future createUserWithEmailAndPassword(String userName, String email, String password) async {
    AuthResult authResult = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    FirebaseUser user = authResult.user;
    UserUpdateInfo userInfo = UserUpdateInfo();
    userInfo.displayName = userName;

    await authResult.user.updateProfile(userInfo);

    await authResult.user.reload();

    return user;
  }
  // sign in with Google
  Future<FirebaseUser> signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;

    return user;
  }

}