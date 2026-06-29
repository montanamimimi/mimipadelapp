import 'package:flutter/material.dart';
import 'package:mimipadel/screens/loading_screen.dart';
import 'package:mimipadel/screens/profile_screen.dart';
import 'package:mimipadel/screens/tournament_screen.dart';
import 'package:mimipadel/screens/tournament_create_screen.dart';
import 'package:mimipadel/screens/tournament_settings_screen.dart';
import 'package:mimipadel/repositories/tournament_repository.dart';

class RouteGenerator {

  static Route<dynamic> generateRoute(RouteSettings settings, TournamentRepository repository) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => LoadingScreen(repository: repository));
      case '/profile':
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case '/create':
        return MaterialPageRoute(builder: (_) => TournamentCreateScreen(repository: repository));
      case '/edit':
        final id = settings.arguments as int;
        return MaterialPageRoute(builder: (_) => TournamentSettingsScreen(tournamentId: id, repository: repository));
      case '/play':
        final id = settings.arguments as int;
        return MaterialPageRoute(builder: (_) => TournamentScreen(tournamentId: id, repository: repository));        
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          body: const Text("404")
        );
      }
    );
  }
}

