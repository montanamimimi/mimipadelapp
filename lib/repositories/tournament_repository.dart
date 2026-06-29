import 'package:mimipadel/models/tournament.dart';
import 'package:mimipadel/models/tournament_player.dart';
// import 'package:mimipadel/services/api_service.dart';
import 'package:mimipadel/services/local_storage_service.dart';
import 'package:flutter/foundation.dart';

class TournamentRepository {

  final LocalStorageService? local;  

  TournamentRepository({required this.local});

  Future<List<Tournament>> getTournaments() async {

    if (kIsWeb) {
    }

    return await local!.getTournaments();
  }

  Future<Tournament?> getTournamentById(int id) async {

    if (kIsWeb) {
    }

    return await local!.getTournament(id);
  }  

  Future<Tournament> createTournament(Tournament tournament) async {
    return await local!.createTournament(tournament);
  }

  Future<void> updateTournament(Tournament tournament) async {    
   await local!.updateTournament(tournament);
  }

  Future<void> deleteTournament(int id) async {
    await local!.deleteTournament(id);
  }

  Future<int> addPlayer(int id, String name) async {
    return await local!.addPlayer(id, name);
  }

  Future<List<TournamentPlayer>> getTournamentPlayers() async {
    return await local!.getTournamentPlayers();
  }

  Future<List<TournamentPlayer>> getTournamentPlayersById(int id) async {
    return await local!.getTournamentPlayersById(id);
  }  

  // Dev only 

  Future<void> cleanDatabase() async {
    await local!.cleanDatabase();
  }
}