import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mimipadel/services/auth.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key, required this.auth});  

  final AuthService auth;

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  bool _isLoading = false;


  Future<void> signInWithEmail() async {
    setState(() {
      _isLoading = true;
    });                       

  }

  Future<void> signInAnonymously() async {
    setState(() {
      _isLoading = true;
    });                       

    try {

      await widget.auth.signInAnon();

      if (!mounted) return;
      
      _goToHomeScreen();

    } catch (e) {
      debugPrint('Login error: $e');
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }  

  void _checkUser() {  
    final user = widget.auth.currentUser();

    if (user != null) {
      _goToHomeScreen();
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
            _isLoading
                ? SpinKitCircle(
                    color: Colors.lightGreen,
                    size: 50.0,
                  )
                : Column(
                  children: [
                    Text('Create your account'),

                    ElevatedButton(
                      onPressed: signInWithEmail,
                      child: Text('Email Login'),
                    ),
                    Text('Skip this step (you will lose all data if app uninstalled)'),
                    
                    ElevatedButton(
                      onPressed: signInAnonymously,
                      child: Text('Skip Login'),
                    )                       
                  ],
                )
          ]
        )
      ),
    );
  }
}