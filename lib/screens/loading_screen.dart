import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mimipadel/services/auth.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key, required this.auth});  

  final AuthService auth;

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

 // final AuthService _auth = AuthService();

  void _checkUser() {  
    final user = widget.auth.currentUser();

    if (user != null) {
      _goToHomeScreen();
    } else {
      print('no user');
    }

  }

  void _goToHomeScreen() {
    Navigator.pushReplacementNamed(
      context,
      '/home'
    );   
  }

  @override
  void initState() {
    super.initState();
    
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      appBar: AppBar(
        elevation: 8.0,
        title: Text('Sign in')
      ),
      body: Center(
        child: Column(
          children: [
            Image(
              image: AssetImage('assets/images/loading.png'),
              width: 100.0,
              height: 100.0,
            ),
            ElevatedButton(
              onPressed: () async {
                dynamic result = await widget.auth.signInAnon();
                
                if (result != null) {                  
                  _goToHomeScreen();
                }
              }, 
              child: Text('Sing in anon')
            )                             
          ]
        )
      ),
    );
  }
}