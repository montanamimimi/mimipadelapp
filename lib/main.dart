import 'package:mimipadel/db/app_db.dart';
import 'package:flutter/material.dart';
import 'package:mimipadel/route/route_generator.dart';
import 'package:mimipadel/services/auth.dart';
import 'package:mimipadel/services/local_storage_service.dart';
import 'package:mimipadel/repositories/tournament_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async { 
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  LocalStorageService? localStorageService;

  if (!kIsWeb) {
    final db = AppDatabase();
    localStorageService = LocalStorageService(db);
  }  

  final tournamentRepository = TournamentRepository(
    local: localStorageService
  );

  final authService = AuthService();

  runApp(MyApp(
    tournamentRepository: tournamentRepository,
    authService: authService,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key, 
    required this.tournamentRepository,
    required this.authService,
    });

  final TournamentRepository tournamentRepository;
  final AuthService authService;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mimi Padel',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.lightGreenAccent),
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) =>
          RouteGenerator.generateRoute(
            settings,
            tournamentRepository,
            authService,
          ),
    );
  }
}
