import 'package:mimipadel/models/player.dart';
import 'package:mimipadel/repositories/players_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:ulid/ulid.dart';

class PlayersController extends ChangeNotifier {
  
  final PlayersRepository repository;  

  PlayersController({required this.repository});

  List<Player> players = [];

  Future<void> getPlayers() async {
    print('loading!');
    players = await repository.getPlayers();
    notifyListeners();
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