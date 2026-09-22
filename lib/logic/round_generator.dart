import 'package:mimipadel/models/tournament_game.dart';
import 'package:mimipadel/models/tournament_player.dart';
import 'package:ulid/ulid.dart';

class RoundGenerator {
  List<TournamentGame> generateAmericanoRounds({
    required List<TournamentPlayer> players,    
    required String id,
  }) {
    final List<TournamentGame> games = [];
    players.shuffle();
    final starter = _starter(players.length);

    
    final int roundsNumber = players.length - 1;

    for (var round = 0; round < roundsNumber; round++){
      
      final List<TournamentGame> roundGames = [];

      for (final game in starter) {
        final gid = Ulid().toString();
        roundGames.add(
         TournamentGame(
            id: gid,
            tournamentId: id, 
            round: round,
            side1Player1Id: _playerAtPosition(players, game[0], round), 
            side1Player2Id: _playerAtPosition(players, game[1], round), 
            side2Player1Id: _playerAtPosition(players, game[2], round), 
            side2Player2Id: _playerAtPosition(players, game[3], round), 
            side1Score: 0, 
            side2Score: 0,          
          ),
        );
      }

      games.addAll(roundGames);      

    }

    return games;
  }


 static String _playerAtPosition<T>(
    List<TournamentPlayer> players,
    int position,
    int round,
  ) {
    if (position == 0) {
      return players[0].id;
    }

    final count = players.length - 1;

    final initialPosition =
        ((position - 1 - round) % count + count) % count + 1;

    return players[initialPosition].id;
  }

  static List<List<int>> _starter(int playerCount) {

    
    switch (playerCount) {
      case 4:
        return [
          [1, 2, 3, 0],
        ];

      case 8:
        return [
          [2, 3, 4, 6],
          [5, 1, 7, 0],
        ];

      case 12:
        return [
          [2, 3, 1, 6],
          [8, 10, 4, 7],
          [5, 9, 11, 0],
        ];

      case 16:
        return [
          [12, 13, 3, 9],
          [4, 6, 14, 2],
          [7, 11, 5, 10],
          [1, 8, 15, 0],
        ];

      case 20:
        return [
          [14, 15, 19, 0],
          [16, 18, 1, 10],
          [4, 7, 6, 13],
          [5, 9, 12, 17],
          [2, 8, 3, 11],
        ];

      case 24:
        return [
          [17, 18, 3, 13],
          [20, 22, 6, 9],
          [15, 19, 8, 16],
          [5, 10, 2, 11],
          [21, 4, 23, 0],
          [7, 14, 1, 12],
        ];

      case 28:
        return [
          [22, 23, 1, 14],
          [5, 7, 8, 17],
          [9, 12, 4, 11],
          [21, 25, 10, 18],
          [19, 24, 3, 15],
          [20, 26, 6, 16],
          [2, 13, 27, 0],
        ];

      default:
        throw UnsupportedError(
          'No Americano starter for $playerCount players.',
        );
    }
  }

}

