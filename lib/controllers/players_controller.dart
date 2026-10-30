import 'package:mimipadel/models/player.dart';
import 'package:mimipadel/models/tournament_player.dart';
import 'package:mimipadel/repositories/players_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:ulid/ulid.dart';

class PlayersController extends ChangeNotifier {
  
  final PlayersRepository repository;  

  PlayersController({required this.repository});

  List<Player> players = [];

  Future<void> getPlayers() async {    
    players = await repository.getLocalPlayers();
    // print(players);
    notifyListeners();
  }  

  Future<void> syncPlayers() async {    
    final apiPlayers = await repository.fetchPlayersFromApi();
    await repository.savePlayers(apiPlayers);
    notifyListeners();
  }    


  List<Player> availablePlayers(List<TournamentPlayer> tournamentPlayers) {
    final existingIds = tournamentPlayers.map((p) => p.playerId).toSet();
    return players.where((p) => !existingIds.contains(p.id)).toList();
  }

  Future<String> addPlayer(String name) async {
    final id = Ulid().toString();
    await repository.addPlayer(id, name);
    await getPlayers();     
    return id;   
  }  

  Future<void> cleanLocalPlayers() async {
    await repository.cleanLocalPlayers();
    await getPlayers();
  }    

}