import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  SignInWithGoogle() async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    if(gUser == null) return;
    final GoogleSignInAuthentication gAuth = await gUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken
    );
    final UserCredential userCredential = await _firebaseAuth.signInWithCredential(credential);
    final user = userCredential.user;
    if(user != null){
      SharedPreferences prefSet = await SharedPreferences.getInstance();
      await prefSet.setString('photoURL', user.photoURL!);
      await prefSet.setString('displayName', user.displayName!);
      await prefSet.setString('email', user.email!);
    }
    return userCredential;
  }
  
  Future<void> singOut() async{
    await GoogleSignIn().signOut();
    await _firebaseAuth.signOut();
    SharedPreferences prefClear = await SharedPreferences.getInstance();
    await prefClear.clear();
  }
}