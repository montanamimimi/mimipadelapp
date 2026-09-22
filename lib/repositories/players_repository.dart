import 'package:mimipadel/services/api_service.dart';
import 'package:mimipadel/services/local_storage_service.dart';
import 'package:mimipadel/models/player.dart';

class PlayersRepository {
  
  final LocalStorageService local;  
  final ApiService api;

  PlayersRepository({required this.local, required this.api});

  Future<List<Player>> getPlayers() async {
    return await local.getPlayers();
  }  

  Future<void> addPlayer(String id, String name) async {
    await local.addPlayer(id, name);
    api.addPlayer(id, name);
  }

  Future<void> cleanLocalPlayers() async {
    await local.cleanPlayers();    
  }     

}