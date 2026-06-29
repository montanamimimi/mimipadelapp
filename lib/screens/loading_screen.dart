import 'package:mimipadel/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mimipadel/repositories/tournament_repository.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key, required this.repository});

  final TournamentRepository repository;

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  Future<void> load() async {  

    try {
      final data = await widget.repository.getTournaments();
      debugPrint('Loaded: ${data.length}');
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => HomeScreen(
            tournaments: data,
            repository: widget.repository,
          ),
        ),
      );
    }

    catch (e, st) {
      debugPrint('LOAD ERROR: $e');
      debugPrint('$st');
    }

  }

  @override
  void initState() {
    super.initState();
    load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      backgroundColor: Colors.blueAccent,
      body: Center(
        child:   Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/padel.jpg'),
                fit: BoxFit.cover,
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