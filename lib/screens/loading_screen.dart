import 'package:mimipadel/controllers/home_controller.dart';
import 'package:mimipadel/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key, required this.controller});

  final HomeController controller;

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  Future<void> _bootstrap() async {  
    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => HomeScreen(
          controller: widget.controller,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _bootstrap();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/loading.png'),
                alignment: Alignment.topCenter,
              ),
          ),
          child: SpinKitFadingCircle(
            color: Colors.white,
            size: 80.0,
          ),
        )
      ),
    );
  }
}