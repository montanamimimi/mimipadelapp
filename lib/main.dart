import 'package:mimipadel/db/app_db.dart';
import 'package:flutter/material.dart';
import 'package:mimipadel/route/route_generator.dart';
import 'package:mimipadel/services/auth.dart';
import 'package:mimipadel/services/local_storage_service.dart';
import 'package:mimipadel/services/api_service.dart';
import 'package:mimipadel/repositories/tournament_repository.dart';
import 'package:mimipadel/repositories/players_repository.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async { 
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  LocalStorageService localStorageService;
  final AuthService auth = AuthService();
  final ApiService api = ApiService(auth);
  final db = AppDatabase();
  localStorageService = LocalStorageService(db);

  final tournamentRepository = TournamentRepository(
    local: localStorageService, 
    api: api,
  );

  final playersRepository = PlayersRepository(
    local: localStorageService, 
    api: api,
  );  

  final authService = AuthService();

  runApp(MyApp(
    tournamentRepository: tournamentRepository,
    playersRepository: playersRepository,
    authService: authService,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key, 
    required this.tournamentRepository,
    required this.playersRepository,
    required this.authService,
    });

  final PlayersRepository playersRepository;
  final TournamentRepository tournamentRepository;
  final AuthService authService;

  // Application root
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
            playersRepository,
            authService,            
          ),
    );
  }
}
