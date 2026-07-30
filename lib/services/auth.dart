import 'package:firebase_auth/firebase_auth.dart';
import 'package:mimipadel/models/mimi_user.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  MimiUser? _getUserFromFirebase(dynamic user) {
    return user != null ? MimiUser(uuid: user.uid) : null; 
  }

  // sign in anon 

  Future signInAnon() async {
    try {
      final UserCredential userCredential = await _auth.signInAnonymously();
      print("Signed in with temporary account.");
      // return  _getUserFromFirebase(userCredential);
      return userCredential;
    } on FirebaseAuthException catch(e) {
      switch (e.code) {
        case "operation-not-allowed":
          print("Anonymous auth hasn't been enabled for this project.");
          break;
        default:
          print("Unknown error.");
      }
      return null;
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      print('I am out!!!');
    } catch(e) {
      print(e.toString());
    }    
  }

  dynamic currentUser() {
    return _auth.currentUser;
  }

  // sign in email

  // sign in google

  // register with email

  // sing out
}