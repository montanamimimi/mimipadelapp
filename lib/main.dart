import 'package:mimipadel/db/app_db.dart';
import 'package:flutter/material.dart';
import 'package:mimipadel/route/route_generator.dart';
import 'package:mimipadel/services/local_storage_service.dart';
import 'package:mimipadel/repositories/tournament_repository.dart';
import 'package:flutter/foundation.dart';

void main() async { 

  LocalStorageService? localStorageService;

  if (!kIsWeb) {
    final db = AppDatabase();
    localStorageService = LocalStorageService(db);
  }  

  final tournamentRepository = TournamentRepository(
    local: localStorageService
  );

  runApp(MyApp(
    tournamentRepository: tournamentRepository,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.tournamentRepository});

  final TournamentRepository tournamentRepository;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mimi Padel',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepOrangeAccent),
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) =>
          RouteGenerator.generateRoute(
            settings,
            tournamentRepository,
          ),
    );
  }
}
