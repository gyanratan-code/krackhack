import 'package:firebase_auth/firebase_auth.dart';

class AuthService{

  Future<String> createAccountWithEmail(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("✅ User Created: ${userCredential.user?.email}");
      return "Account created";
    } on FirebaseAuthException catch (e) {
      print("❌ Firebase Auth Error: ${e.code} - ${e.message}");
      return e.message.toString();
    }
  }

  Future<String> loginWithEmailAndPassword(String email, String password) async{
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      return "Login successful";
    } on FirebaseAuthException catch(e){
      return e.message.toString();
    }
  }

  Future<String> logOut() async{
    try{
      await FirebaseAuth.instance.signOut();
      return "Logout Successful";
    } on FirebaseAuthException catch(e){
      return e.message.toString();
    }
  }

  Future<bool> isLoggedIn() async{
    var user = FirebaseAuth.instance.currentUser;
    return user != null;
  }
}