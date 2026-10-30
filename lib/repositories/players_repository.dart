import 'package:mimipadel/services/api_service.dart';
import 'package:mimipadel/services/local_storage_service.dart';
import 'package:mimipadel/models/player.dart';

class PlayersRepository {
  
  final LocalStorageService local;  
  final ApiService api;

  PlayersRepository({required this.local, required this.api});

  Future<List<Player>> getLocalPlayers() async {
    return await local.getPlayers();
  }  

  Future<List<Player>> fetchPlayersFromApi() async {
    return await api.loadPlayers();
  }

  Future<void> savePlayers(List<Player> players) async {
    await local.syncPlayers(players);    
  }      

  Future<void> addPlayer(String id, String name) async {
    await local.addPlayer(id, name);
    api.addPlayer(id, name);
  }

  Future<void> cleanLocalPlayers() async {
    await local.cleanPlayers();    
  }     

}