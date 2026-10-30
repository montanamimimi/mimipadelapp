import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mimipadel/models/mimi_user.dart';
import 'package:mimipadel/services/auth.dart';
import 'package:mimipadel/services/connectivity_service.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key, required this.auth});  

  final AuthService auth;

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  bool _isLoading = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _connectivityService = ConnectivityService();
  bool _isSignUp = true;
  bool _hasInternet = false;
  String error = "";

  Future<void> _checkInternet() async {
    setState(() => _isLoading = true);

    final hasInternet = await _connectivityService.checkInternet();

    if (!mounted) return;

    setState(() {
      _hasInternet = hasInternet;
      _isLoading = false;
    });

  }

  Future<void> signInWithEmail() async {
    setState(() {
      _isLoading = true;
    });

    MimiUser? user = MimiUser(id: '', firebaseUid: '');

    try {
      if (_isSignUp) {
        user = await widget.auth.signUpWithEmail(
          _emailController.text.trim(),
          _passwordController.text,
        );
      } else {
        user = await widget.auth.signInWithEmail(
          _emailController.text.trim(),
          _passwordController.text,
        );

      }

      if (user == null) {
        setState(() {
          _isLoading = false;
        });        
        return;
      }
      if (!mounted) return;
      
      _goToHomeScreen();

    } catch (e) {
      print(e.toString());
    } 

  }

  Future<void> signInAnonymously() async {
    setState(() {
      _isLoading = true;
    });                       

    try {

      final result = await widget.auth.signInAnon();

      if (result.success) {
        _goToHomeScreen();
      } else {
        setState(() {
          error = result.error!;
        });
      }      

      // if (!mounted) return;
    } catch (e) {
        setState(() {
          error = e.toString();
        });      
    
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
    _checkInternet();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      body: Center(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
            child: Column(
              children: [
                Image(
                  image: AssetImage('assets/images/loading.png'),
                  width: 100.0,
                  height: 100.0,
                ),
                Text(error),               
                if (_hasInternet) ...[
                _isLoading
                  ? SpinKitCircle(
                      color: Colors.lightGreen,
                      size: 50.0,
                    )
                  : Column(
                    children: [
                      Text('Sing Up / Sign In'),
                  TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                    ),
                  ),

                  const SizedBox(height: 16),

                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                    ),
                  ),

                  const SizedBox(height: 24),
                      // ElevatedButton(
                      //   onPressed: signInWithEmail,
                      //   child: Text('Register'),
                      // ),
                      ElevatedButton(
                        onPressed: () async {
                          setState(() => _isSignUp = false);
                          await signInWithEmail();
                        },
                        child: Text('Sing In'),
                      ),                    
                      // Text('Skip this step (you will lose all data if app uninstalled)'),
                      
                      // ElevatedButton(
                      //   onPressed: signInAnonymously,
                      //   child: Text('Skip Login'),
                      // )                       
                    ],
                  ),
                ] else ...[
                  SizedBox(
                    height: 20.0
                  ),
                  Text('You are offline!'),
                  ElevatedButton(
                    onPressed: () async {
                      await _checkInternet();
                    }, 
                    child: const Text('Reload'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _goToHomeScreen();
                    },
                    child: const Text('Continue offline'),
                  ),
                ],            

              ]
            ),
          )
        ),
      ),
    );
  }
}