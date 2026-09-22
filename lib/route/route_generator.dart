import 'package:flutter/material.dart';
import 'package:mimipadel/controllers/home_controller.dart';
import 'package:mimipadel/controllers/tournament_controller.dart';
import 'package:mimipadel/controllers/players_controller.dart';
import 'package:mimipadel/screens/home_screen.dart';
import 'package:mimipadel/screens/loading_screen.dart';
import 'package:mimipadel/screens/profile_screen.dart';
import 'package:mimipadel/screens/players_screen.dart';
import 'package:mimipadel/screens/tournament_screen.dart';
import 'package:mimipadel/repositories/tournament_repository.dart';
import 'package:mimipadel/repositories/players_repository.dart';
import 'package:mimipadel/services/auth.dart';

class RouteGenerator {

  static Route<dynamic> generateRoute(
    RouteSettings settings, 
    TournamentRepository repository,
    PlayersRepository playersRepository,

    AuthService authService,
    ) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => LoadingScreen(auth: authService));
      case '/home':
        return MaterialPageRoute(builder: (_) => HomeScreen(
          controller: HomeController(repository: repository),
          auth: authService,
          ));        
      case '/profile':
        return MaterialPageRoute(builder: (_) => ProfileScreen(auth: authService));
      case '/players':
        return MaterialPageRoute(builder: (_) => PlayersScreen(
          controller: PlayersController(repository: playersRepository),
        ));
      case '/tournament':
        final args = settings.arguments as Map<String, dynamic>;
        final id = args['id'];
        final mode = args['mode'];
        final format = args['format'];
        return MaterialPageRoute(
          builder: (_) => TournamentScreen(
            tournamentId: id, 
            controller: TournamentController(repository: repository),
            playersController: PlayersController(repository: playersRepository),
            mode: mode, 
            format: format,
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

