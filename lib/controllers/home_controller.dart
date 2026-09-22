import 'package:flutter/material.dart';
import 'package:mimipadel/repositories/tournament_repository.dart';
import 'package:mimipadel/models/tournament.dart';

class HomeController extends ChangeNotifier {
  HomeController({
    required this.repository,
  });

  final TournamentRepository repository;

  List<Tournament> tournaments = [];

  Future<void> getTournaments() async {    
    tournaments = await repository.getTournaments();

    // print('TOURNAMENT ROWS: ${tournaments.length}');
    // print('TOURNAMENT ROWS: $tournaments');

    notifyListeners();
  }


  Future<void> deleteLocalData() async {
    await repository.deleteLocalData();
  }      
}