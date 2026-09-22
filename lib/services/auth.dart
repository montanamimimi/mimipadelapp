import 'package:firebase_auth/firebase_auth.dart';
import 'package:mimipadel/models/mimi_user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mimipadel/config/app_config.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // sign in anon 

  Future<MimiUser?> signInAnon() async {
    try {
      await _auth.signInAnonymously();
      
      final MimiUser? user = await syncUser();

      return user;

    } on FirebaseAuthException catch(e) {
      print(e.code);
      return null;
    }
  }

  Future<MimiUser?> signUpWithEmail(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final MimiUser? user = await syncUser();

      return user;

    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  Future<MimiUser?> signInWithEmail(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final MimiUser? user = await syncUser();

      return user;

    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch(e) {
      print(e.toString());  
    }    
  }

  User? currentUser() {
    return _auth.currentUser;
  }


  Future<String?> getIdToken() async {
    final user = _auth.currentUser;

    if (user == null) {
      return null;
    }

    return await user.getIdToken();
  }  

  Future<MimiUser?> syncUser() async {
      final idToken = await getIdToken();

      if (idToken == null) {
        return null;
      }

      final response = await http.get(
        Uri.parse('${AppConfig.apiUrl}/me'),
        headers: {
          'Authorization': 'Bearer $idToken',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return MimiUser.fromJson(data['user']);
      } else {
        print('Error: ${response.statusCode}');
        print(response.body);
        return null;
      }            
  }

}