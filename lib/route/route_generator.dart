import 'package:flutter/material.dart';
import 'package:mimipadel/controllers/home_controller.dart';
import 'package:mimipadel/controllers/tournament_controller.dart';
import 'package:mimipadel/screens/loading_screen.dart';
import 'package:mimipadel/screens/profile_screen.dart';
import 'package:mimipadel/screens/tournament_screen.dart';
import 'package:mimipadel/repositories/tournament_repository.dart';

class RouteGenerator {

  static Route<dynamic> generateRoute(RouteSettings settings, TournamentRepository repository) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => LoadingScreen(controller: HomeController(repository: repository)));
      case '/profile':
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case '/tournament':
        final args = settings.arguments as Map<String, dynamic>;
        final id = args['id'];
        final mode = args['mode'];
        return MaterialPageRoute(
          builder: (_) => TournamentScreen(
            tournamentId: id, 
            controller: TournamentController(repository: repository),
            mode: mode
          ));
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

