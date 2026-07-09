import 'package:mimipadel/models/tournament_player.dart';
import 'package:mimipadel/repositories/tournament_repository.dart';
import 'package:mimipadel/models/tournament.dart';
import 'package:mimipadel/models/tournament_game.dart';
import 'package:mimipadel/models/tournament_standing.dart';
import 'package:flutter/foundation.dart';

class TournamentController extends ChangeNotifier {

  final TournamentRepository repository;

  TournamentController({required this.repository});

  Tournament? tournament;
  List<TournamentGame> games = [];
  List<TournamentPlayer> players = [];
  List<TournamentStanding> standings = [];
  bool gameReady = false; 
  int round = 0;

  bool roundReady = false;

  // bool _roundReady = false;
  // bool get roundReady => _roundReady;
  // set roundReady(bool value) {
  //   if (_roundReady == value) return;
  //   _roundReady = value;
  //   notifyListeners();
  // }  

  Future<void> load(int id) async {
    tournament = await repository.getTournamentById(id);
    if (tournament == null) {
      return;
    }
    players = await repository.getTournamentPlayersById(tournament!.id);   
    games = await repository.getTournamentGamesById(tournament!.id);


    if (games.isEmpty) {      
      checkReady();
    } else {
      round = games
          .map((g) => g.gameNumber)
          .reduce((a, b) => a > b ? a : b);      
    }

    calculateStandings();
    checkRoundReady(); 
  }

  Future<void> update() async {   
    await repository.updateTournament(tournament!);
  }

  Future<void> switchMixer(bool value) async {
    tournament!.mixer = value;
    await repository.updateTournament(tournament!);
    notifyListeners();
  }  

  Future<void> updateName(String name) async {
    tournament = tournament!.copyWith(name: name);    
    notifyListeners();
    await repository.updateTournament(tournament!);
  }  

  Future<int> create(Tournament tournament) async {
    final t = await repository.createTournament(tournament);
    return t.id;
  }  

  Future<void> delete() async {
    await repository.deleteTournament(tournament!.id);
  }

  Future<void> addPlayer(String name) async {
    await repository.addPlayer(tournament!.id, name);
    players = await repository.getTournamentPlayersById(tournament!.id);
    checkReady();
  }

  Future<void> removePlayer(int id) async {
    await repository.removePlayer(id);
    players = await repository.getTournamentPlayersById(tournament!.id);
    checkReady();
  }

  Future<void> startTournament() async {
    tournament!.started = true;    
    await update();

    if (games.isEmpty) {
      generateRandomGames();
      await repository.insertTournamentGames(games);
      games = await repository.getTournamentGamesById(tournament!.id);
    }
  }

  // Manage games

  Future<void> updateGameScore(int id, int side1, int side2) async {
    for (var i = 0; i < games.length; i++) {
      if (games[i].id == id) {
        games[i].side1Score = side1;
        games[i].side2Score = side2;
      }
    }
    
    await repository.updateGameScore(id, side1, side2);
    calculateStandings();
    checkRoundReady(); 
  }

  void checkRoundReady() {

    roundReady = false;

    if (tournament != null) {      

      bool gameReady = true;      

      for (final game in games) {
        if (game.gameNumber == round) {
          if ((game.side1Score + game.side2Score) != tournament!.points) {
            gameReady = false;
          }
        }
      }
      roundReady = gameReady;    
    }

    notifyListeners();
  }  

  Future<void> nextRound() async {
    round = round + 1;

    final maxRound = games
        .map((g) => g.gameNumber)
        .reduce((a, b) => a > b ? a : b);    

    if (round > maxRound) {
      final newGames = generateRoundGames();
      await repository.insertTournamentGames(newGames);
      // await load (tournament!.id);
      games = await repository.getTournamentGamesById(tournament!.id);
    }
    checkRoundReady();
  }

  Future<void> prevRound() async {
    round = round - 1;
    checkRoundReady(); 
  }   

  String getPlayerName(int id) {
    return players.firstWhere((e) => e.id == id).name;
  }  

  void calculateStandings() {
    final newStandings = {
      for (final p in players)
        p.id: TournamentStanding(
          playerId: p.id,
          playerName: getPlayerName(p.id),
        ),
    };

    for (final game in games) {
      newStandings[game.side1Player1Id]?.score += game.side1Score;
      newStandings[game.side1Player2Id]?.score += game.side1Score;
      newStandings[game.side2Player1Id]?.score += game.side2Score;
      newStandings[game.side2Player2Id]?.score += game.side2Score;
    }

    standings = newStandings.values.toList()
      ..sort((a, b) => b.score.compareTo(a.score));    

    standings.sort((a, b) {
      final scoreCompare = b.score.compareTo(a.score);

      return scoreCompare != 0
          ? scoreCompare
          : a.playerName.compareTo(b.playerName);
    });
  }    

  List<TournamentGame> generateRoundGames() {
    calculateStandings();

    final List<TournamentGame> newGames = [];
    
    int playerIndex = 0;

    for( var i = 0; i < tournament!.courts; i++) {

      var player1 = standings[playerIndex].playerId;
      var player2 = standings[playerIndex + 1].playerId;
      var player3 = standings[playerIndex + 2].playerId;
      var player4 = standings[playerIndex + 3].playerId;

      if (tournament!.mixer) {

        final List<List<int>> previousPairing = getPreviousPairing();
        final List<int> checked = checkPlayers(player1, player2, player3, player4, previousPairing);
        player1 = checked[0];
        player2 = checked[1];
        player3 = checked[2];
        player4 = checked[3];
      }

      TournamentGame game = TournamentGame(
        id: i, 
        tournamentId: tournament!.id, 
        gameNumber: round, 
        side1Player1Id: player1, 
        side1Player2Id: player2, 
        side2Player1Id: player3, 
        side2Player2Id: player4, 
        side1Score: 0, 
        side2Score: 0
        );
      playerIndex = playerIndex + 4;  
      newGames.add(game);
    }   

    return newGames;
  }

  List<List<int>> getPreviousPairing(){
    
    final List<List<int>> arr = [];

    for(var game in games) {
      if (game.gameNumber == (round-1)) {
        final item = [game.side1Player1Id, game.side1Player2Id];
        item.sort();
        arr.add(item);
      }
    }

    return arr;
  }

  List<int> checkPlayers(int a, int b, int c, int d, List<List<int>> prevArray) {

    final List<int> ab = [a, b];
    final List<int> cd = [c, d];
    bool needToChange = false;

    ab.sort();
    cd.sort();

    for (var pair in prevArray) {
      if (listEquals(ab, pair) || listEquals(cd, pair)) {
        needToChange = true;
      }
    }

    if (needToChange) {
      return [a, c, b, d];
    } else {
      return [a, b, c, d];
    }
    
  }

  void generateRandomGames() {
    players.shuffle();
    int playerIndex = 0;

    for( var i = 0; i < tournament!.courts; i++) {
      TournamentGame game = TournamentGame(
        id: i, 
        tournamentId: tournament!.id, 
        gameNumber: 0, 
        side1Player1Id: players[playerIndex].id, 
        side1Player2Id: players[playerIndex+1].id, 
        side2Player1Id: players[playerIndex+2].id, 
        side2Player2Id: players[playerIndex+3].id, 
        side1Score: 0, 
        side2Score: 0
        );
      playerIndex = playerIndex + 4;  
      games.add(game);
    }   
  }

  void checkReady() {
    gameReady = players.length >= tournament!.courts*4;
  }
}