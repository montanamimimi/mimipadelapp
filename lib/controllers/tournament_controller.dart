import 'package:mimipadel/models/tournament_player.dart';
import 'package:mimipadel/repositories/tournament_repository.dart';
import 'package:mimipadel/models/tournament.dart';
import 'package:mimipadel/models/tournament_game.dart';
import 'package:mimipadel/models/tournament_standing.dart';
import 'package:flutter/foundation.dart';
import 'package:ulid/ulid.dart';

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

  Future<void> load(String id) async {
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
          .map((g) => g.round)
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

  Future<void> updatePlayerName(String id, String name) async {
    await repository.updatePlayerName(id, name);

    final index = players.indexWhere((p) => p.id == id);
    if (index != -1) {
      players[index] = players[index].copyWith(name: name);
    }

    notifyListeners();
  }  

  Future<String> create(String name, DateTime date, int courts, int points) async {
    final id = Ulid().toString();

    print(id);

    await repository.createTournament(
      Tournament(
        id: id,
        name: name,
        date: date,
        courts: courts,
        points: points,      
      )
    );

    return id;
  }  

  Future<void> delete() async {
    await repository.deleteTournament(tournament!.id);
  }

  Future<void> addPlayer(String name) async {
    final id = Ulid().toString();
    await repository.addPlayer(id, tournament!.id, name);
    players = await repository.getTournamentPlayersById(tournament!.id);
    checkReady();
    notifyListeners();
  }

  Future<void> removePlayer(String id) async {
    await repository.removePlayer(id);
    players = await repository.getTournamentPlayersById(tournament!.id);
    checkReady();
    notifyListeners();
  }

  Future<void> startTournament() async {
    tournament!.started = true;
    await update();

    if (games.isEmpty) {
      final newGames = generateRandomGames();
      await repository.insertTournamentGames(newGames);
      games = await repository.getTournamentGamesById(tournament!.id);
    }

    roundReady = false;
  }

  // Manage games

  Future<void> updateGameScore(String id, int side1, int side2) async {
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
        if (game.round == round) {
          if ((game.side1Score + game.side2Score) != tournament!.points) {
            gameReady = false;
          }
        }
      }
      roundReady = gameReady;    
    }

    notifyListeners();
  } 

  // Totally reshuffle current round

  Future<void> shuffleRound() async {
    final newGames = generateRandomGames();
    await repository.cleanTournamentRoundGames(tournament!.id, round);
    await repository.insertTournamentGames(newGames);
    games = await repository.getTournamentGamesById(tournament!.id);
  }

  // Recalculate round results based on games

  Future<void> recalculateRound() async {
    await repository.cleanTournamentRoundGames(tournament!.id, round);
    games = await repository.getTournamentGamesById(tournament!.id);    
    final newGames = generateRoundGames();    
    await repository.insertTournamentGames(newGames);
    games = await repository.getTournamentGamesById(tournament!.id);
  }

  int getMaxRound() {

    if (games.length > 0) {
      return games
          .map((g) => g.round)
          .reduce((a, b) => a > b ? a : b);
    } else {
      return 0;
    }

  }

  Future<void> nextRound() async {
    round = round + 1;
    notifyListeners();

    final maxRound = getMaxRound();

    if (round > maxRound) {
      final newGames = generateRoundGames();
      await repository.insertTournamentGames(newGames);     
      games = await repository.getTournamentGamesById(tournament!.id);
    }
    checkRoundReady();
  }

  Future<void> prevRound() async {
    notifyListeners();
    round = round - 1;
    checkRoundReady(); 
  }   

  String getPlayerName(String id) {
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
      newStandings[game.side1Player1Id]?.diff += game.side1Score - game.side2Score;
      newStandings[game.side1Player2Id]?.diff += game.side1Score - game.side2Score;
      newStandings[game.side2Player1Id]?.diff += game.side2Score - game.side1Score;
      newStandings[game.side2Player2Id]?.diff += game.side2Score - game.side1Score;

      if (game.side1Score > game.side2Score) {
        newStandings[game.side1Player1Id]?.win += 1;
        newStandings[game.side1Player2Id]?.win += 1;
        newStandings[game.side2Player1Id]?.lose += 1;
        newStandings[game.side2Player2Id]?.lose += 1;
      } else if (game.side2Score > game.side1Score) {
        newStandings[game.side1Player1Id]?.lose += 1;
        newStandings[game.side1Player2Id]?.lose += 1;
        newStandings[game.side2Player1Id]?.win += 1;
        newStandings[game.side2Player2Id]?.win += 1;
      } else if ((game.side2Score == game.side1Score) && (game.side2Score > 0) && (game.side1Score > 0)) {
        newStandings[game.side1Player1Id]?.tie += 1;
        newStandings[game.side1Player2Id]?.tie += 1;
        newStandings[game.side2Player1Id]?.tie += 1;
        newStandings[game.side2Player2Id]?.tie += 1;
      }
    }

    standings = newStandings.values.toList(); 

    standings.sort((a, b) {
      int result;

      result = b.score.compareTo(a.score); 
      if (result != 0) return result;

      result = b.win.compareTo(a.win);
      if (result != 0) return result;

      result = a.lose.compareTo(b.lose);
      if (result != 0) return result;

      return a.playerName.compareTo(b.playerName); // ascending
    });
  }    

  List<TournamentGame> generateRoundGames() {
    calculateStandings();   

    final List<TournamentGame> newGames = [];
    
    int playerIndex = 0;
    final List<List<String>> previousPairing = getPreviousPairing();
    for( var i = 0; i < tournament!.courts; i++) {

      var player1 = standings[playerIndex].playerId;
      var player2 = standings[playerIndex + 2].playerId;
      var player3 = standings[playerIndex + 1].playerId;
      var player4 = standings[playerIndex + 3].playerId;

      if (tournament!.mixer) {       
        final List<String> checked = checkPlayers(player1, player2, player3, player4, previousPairing);
        player1 = checked[0];
        player2 = checked[1];
        player3 = checked[2];
        player4 = checked[3];
      }
      final id = Ulid().toString();
      TournamentGame game = TournamentGame(
        id: id, 
        tournamentId: tournament!.id, 
        round: round, 
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

  List<List<String>> getPreviousPairing(){
    
    final List<List<String>> arr = [];

    for(var game in games) {
      if (game.round == (round-1)) {
        final item1 = [game.side1Player1Id, game.side1Player2Id];
        item1.sort();
        arr.add(item1);
        final item2 = [game.side2Player1Id, game.side2Player2Id];
        item2.sort();
        arr.add(item2);        
      }
    }

    return arr;
  }

  List<String> checkPlayers(String a, String b, String c, String d, List<List<String>> prevArray) {

    final List<String> ab = [a, b];
    final List<String> cd = [c, d];
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

  List<TournamentGame> generateRandomGames() {
    players.shuffle();
    int playerIndex = 0;
    final List<TournamentGame> randomGames = [];

    for( var i = 0; i < tournament!.courts; i++) {
      final id = Ulid().toString();
      TournamentGame game = TournamentGame(
        id: id,
        tournamentId: tournament!.id, 
        round: round,
        side1Player1Id: players[playerIndex].id, 
        side1Player2Id: players[playerIndex+1].id, 
        side2Player1Id: players[playerIndex+2].id, 
        side2Player2Id: players[playerIndex+3].id, 
        side1Score: 0, 
        side2Score: 0
        );
      playerIndex = playerIndex + 4;  
      randomGames.add(game);
    }
    
    return randomGames;
  }

  void checkReady() {
    gameReady = players.length >= tournament!.courts*4;
  }
}