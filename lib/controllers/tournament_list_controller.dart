import 'package:flutter/material.dart';
import 'package:mimipadel/repositories/tournament_repository.dart';
import 'package:mimipadel/models/tournament.dart';

class TournamentListController extends ChangeNotifier {
  TournamentListController(this.repository);

  final TournamentRepository repository;

  List<Tournament> tournaments = [];

  bool isLoading = false;

  Future<void> load() async {
    isLoading = true;
    notifyListeners();

    tournaments = await repository.getTournaments();

    isLoading = false;
    notifyListeners();
  }

  Future<void> delete(String id) async {
    await repository.deleteTournament(id);

    tournaments.removeWhere((e) => e.id == id);

    notifyListeners();
  }
}